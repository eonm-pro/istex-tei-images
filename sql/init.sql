SET preserve_insertion_order = false;

CREATE TABLE tei_image_references AS
SELECT
    document_path,
    image_url
FROM read_csv(
    getenv('TEI_IMAGES_TSV_PATH'),
    columns = {
        'document_path': 'VARCHAR',
        'image_url': 'VARCHAR'
    },
    header = false,
    delim = '\t',
    quote = '',
    ignore_errors = true
);

CREATE INDEX idx_tei_image_references_doc_path
    ON tei_image_references (document_path);

CREATE OR REPLACE VIEW tei_image_references_clean AS
SELECT
    document_path,
    image_url AS image_url_raw,
    NULLIF(regexp_replace(image_url, '^\s+|\s+$', '', 'g'), '') AS image_url
FROM tei_image_references;

CREATE OR REPLACE VIEW document_image_analysis AS
WITH document_counts AS (
    SELECT
        document_path,
        COUNT(*)                                   AS total_reference_count,
        COUNT(image_url)                           AS image_count,         -- non-empty only
        COUNT(*) - COUNT(image_url)                AS empty_image_count,   -- NULL or blank
        COUNT(DISTINCT image_url)                  AS unique_image_count
    FROM tei_image_references_clean
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
    dc.total_reference_count,
    dc.image_count,
    dc.empty_image_count,
    dc.unique_image_count,
    gs.avg_images_per_doc,
    gs.max_images_per_doc,
    gs.min_images_per_doc
FROM document_counts dc
CROSS JOIN global_stats gs;

CREATE OR REPLACE VIEW global_image_stats AS
SELECT
    COUNT(DISTINCT document_path)                              AS documents_total,
    COUNT(DISTINCT document_path) FILTER (WHERE image_url IS NOT NULL)
                                                               AS documents_with_images,
    COUNT(*)                                                   AS total_reference_rows,
    COUNT(image_url)                                           AS total_image_calls,
    COUNT(*) - COUNT(image_url)                                AS empty_image_rows,
    COUNT(DISTINCT image_url)                                  AS unique_images
FROM tei_image_references_clean;

CREATE OR REPLACE VIEW images_extensions AS 
SELECT
    regexp_extract(string_split(image_url, '/')[-1], '.+(\.[^.]+)$', 1) AS extension,
    count(*) AS nb
    FROM tei_image_references
    WHERE image_url IS NOT NULL
    GROUP BY extension
    ORDER BY nb DESC LIMIT 10;