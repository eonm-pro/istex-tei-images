#!/usr/bin/env bash
set -uo pipefail

CORPUS_OUTPUT="${CORPUS_OUTPUT:-}"
OUTPUT_FILE="/tmp/images_tei.tsv.gz"
LOG_FILE="/tmp/images_tei.log"
NAMESPACE="http://www.tei-c.org/ns/1.0"

if [[ -z "$CORPUS_OUTPUT" || ! -d "$CORPUS_OUTPUT" ]]; then
    echo "ERROR: CORPUS_OUTPUT must be set to an existing directory." >&2
    exit 1
fi

for cmd in xmlstarlet gzip; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "ERROR: $cmd is not installed." >&2
        exit 1
    fi
done

echo "Starting TEI image URL extraction at $(date)" > "$LOG_FILE"

(
    find "$CORPUS_OUTPUT" \
        -mindepth 6 \
        -maxdepth 6 \
        -wholename '*/fulltext/*.tei.xml' \
        -type f \
        -print0 |
    while IFS= read -r -d '' file; do
        echo "Processing: $file" >> "$LOG_FILE"
        xmlstarlet sel \
            -N tei="$NAMESPACE" \
            -t \
            -m "//tei:graphic" \
            -o "$file" \
            -o "$(printf '\t')" \
            -v "@url" \
            -n \
            2>>"$LOG_FILE" || echo "ERROR: Failed to process $file" >> "$LOG_FILE"
    done
) | gzip > "$OUTPUT_FILE"

echo "Completed at $(date)" >> "$LOG_FILE"