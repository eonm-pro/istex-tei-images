# Makefile for TEI image analysis and database indexing
# Prerequisites:
#   - extract_tei_images.sh (executable)
#   - index_images.sql
#   - DuckDB CLI installed
#
# Usage:
#   make                # Run full pipeline
#   make analyse        # Extract image URLs from TEI files
#   make create_db      # Create and initialize database from TSV
#   make export         # Export analysis results
#   make clean          # Remove generated files
#   make help           # Show this help

# --- Configuration (customize these) ---
CORPUS_DIR ?= /path/to/corpus
TSV_GZ_FILE ?= /tmp/images_tei.tsv.gz
DB_SCRIPT ?= sql/init.sql
OUTPUT_DB ?= tei_images.db
ANALYSIS_CSV ?= analysis_results.csv

# --- Targets ---
all: analyse create_db export

$(TSV_GZ_FILE):
	@echo "=== Analyzing TEI XML files ==="
	@mkdir -p $(dir $(TSV_GZ_FILE))
	CORPUS_OUTPUT=$(CORPUS_DIR) ./scripts/extract_tei_images.sh
	@echo "✓ TSV generated: $(TSV_GZ_FILE)"

analyse: $(TSV_GZ_FILE)

create_db: $(TSV_GZ_FILE)
	@echo "=== Creating and initializing DuckDB database ==="
	@mkdir -p $(dir $(OUTPUT_DB))
	TEI_IMAGES_TSV_PATH=$(TSV_GZ_FILE) duckdb -init $(DB_SCRIPT) $(OUTPUT_DB) 
	@echo "✓ Database created and initialized: $(OUTPUT_DB)"

export: create_db
	@echo "=== Exporting analysis results ==="
	duckdb -c "COPY (SELECT * FROM document_image_analysis) TO '$(ANALYSIS_CSV)' (HEADER, DELIMITER ',');" $(OUTPUT_DB)
	@echo "✓ Results exported: $(ANALYSIS_CSV)"

clean:
	@echo "=== Cleaning up ==="
	-rm -f $(TSV_GZ_FILE) $(OUTPUT_DB) $(ANALYSIS_CSV)
	@echo "✓ Cleanup complete"

help:
	@echo "Available targets:"
	@echo "  all       - Run full pipeline (analyse + create_db + export)"
	@echo "  analyse   - Extract image URLs from TEI XML files"
	@echo "  create_db - Create and initialize DuckDB database from TSV"
	@echo "  export    - Export analysis results to CSV"
	@echo "  clean     - Remove all generated files"
	@echo "  help      - Show this help message"
	@echo ""
	@echo "Configuration variables (current values):"
	@echo "  CORPUS_DIR    = $(CORPUS_DIR)"
	@echo "  TSV_GZ_FILE   = $(TSV_GZ_FILE)"
	@echo "  DB_SCRIPT     = $(DB_SCRIPT)"
	@echo "  OUTPUT_DB     = $(OUTPUT_DB)"
	@echo "  ANALYSIS_CSV  = $(ANALYSIS_CSV)"

.PHONY: all analyse create_db export clean help
