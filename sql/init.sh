SET preserve_insertion_order = false;

CREATE TABLE tei_image_references AS
SELECT
    document_path,
    image_url
FROM read_csv_auto(
    getenv('TEI_IMAGES_TSV_PATH'),  -- Renamed from MY_TSV for clarity
    COLUMNS = {
        'document_path': 'VARCHAR',
        'image_url': 'VARCHAR'
    },
    header = false,
    sep = '\t',
    ignore_errors = true  -- Skip malformed rows
);

CREATE INDEX idx_tei_image_references_doc_path ON tei_image_references (document_path);

CREATE VIEW document_image_analysis AS
WITH document_counts AS (
    SELECT
        document_path,
        COUNT(*) AS image_count
    FROM tei_image_references
    GROUP BY document_path
),
global_stats AS (
    SELECT
        AVG(image_count) AS avg_images_per_doc,
        MAX(image_count) AS max_images_per_doc,
        MIN(image_count) AS min_images_per_doc
    FROM document_counts
)
SELECT
    dc.document_path,
    dc.image_count,
    gs.avg_images_per_doc,
    gs.max_images_per_doc,
    gs.min_images_per_doc
FROM document_counts dc
CROSS JOIN global_stats gs;