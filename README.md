# Istex TEI Image Analysis

> Analyse des références d'images dans les fichiers TEI du corpus ISTEX

[![Onyxia](https://img.shields.io/badge/Onyxia%20(sspcloud)-Créer%20un%20nouveau%20service-blue.svg?logo=data:image/svg+xml;base64,PHN2ZyBjbGFzcz0ib255eGlhLWZpbGwtdXNlQ2FzZXMtdHlwb2dyYXBoeS10ZXh0Rm9jdXMgdHNzLXUyczk5NC1UaGVtZWRTdmctcm9vdC1CcmFuZEhlYWRlclNlY3Rpb24tbG9nbyIgdmlld0JveD0iMzMgMTkgMzc1IDI1NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBmaWxsPSIjRkY1NjJDIj4KICA8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJzcGxhc2hzY3JlZW4tYW5pbWF0aW9uLWdyb3VwMSI+CiAgICA8cGF0aCBkPSJNMjMyLjc0MyA4OC43Nzc0TDI2Ni42OTMgMTIyLjg5OEMyNzcuNTAyIDEzMy43NjEgMjk1LjAxOCAxMzMuNzYxIDMwNS44MTIgMTIyLjg5OEwzMzkuNzYyIDg4Ljc3NzRMMjg2LjI1MyAzNUwyMzIuNzQzIDg4Ljc3NzRaIj48L3BhdGg+CiAgICA8cGF0aCBkPSJNMTA2LjI1MyA4OC43Nzc0TDE0MC4yMDQgMTIyLjg5OEMxNTEuMDEyIDEzMy43NjEgMTY4LjUyOCAxMzMuNzYxIDE3OS4zMjIgMTIyLjg5OEwyMTMuMjczIDg4Ljc3NzRMMTU5Ljc2MyAzNUwxMDYuMjUzIDg4Ljc3NzRaIj48L3BhdGg+ICAgCiAgPC9nPgogIDxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9InNwbGFzaHNjcmVlbi1hbmltYXRpb24tZ3JvdXAyIj4KICAgICAgPHBhdGggZD0iTTQzIDE1Mi4zMzFMNzYuOTUwOCAxODYuNDUyQzg3Ljc1OTQgMTk3LjMxNCAxMDUuMjc1IDE5Ny4zMTQgMTE2LjA2OSAxODYuNDUyTDE1MC4wMiAxNTIuMzMxTDk2LjUwOTkgOTguNTUzN0w0MyAxNTIuMzMxWiI+PC9wYXRoPgogICAgICA8cGF0aCBkPSJNMTY5LjQ5IDE1Mi4zMzFMMjAzLjQ0MSAxODYuNDUyQzIxNC4yNSAxOTcuMzE0IDIzMS43NjUgMTk3LjMxNCAyNDIuNTU5IDE4Ni40NTJMMjc2LjUxIDE1Mi4zMzFMMjIzIDk4LjU1MzdMMTY5LjQ5IDE1Mi4zMzFaIj48L3BhdGg+CiAgICAgIDxwYXRoIGQ9Ik0zNDkuNDkgOTguNTUzN0wyOTUuOTggMTUyLjMzMUwzMjkuOTMxIDE4Ni40NTJDMzQwLjc0IDE5Ny4zMTQgMzU4LjI1NiAxOTcuMzE0IDM2OS4wNDkgMTg2LjQ1Mkw0MDMgMTUyLjMzMUwzNDkuNDkgOTguNTUzN1oiPjwvcGF0aD4KICA8L2c+CiAgPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBjbGFzcz0ic3BsYXNoc2NyZWVuLWFuaW1hdGlvbi1ncm91cDMiPgogICAgPHBhdGggZD0iTTEwNi4yNTMgMjE1LjlMMTQwLjIwNCAyNTAuMDJDMTUxLjAxMiAyNjAuODgzIDE2OC41MjggMjYwLjg4MyAxNzkuMzIyIDI1MC4wMkwyMTMuMjczIDIxNS45TDE1OS43NjMgMTYyLjEyM0wxMDYuMjUzIDIxNS45WiI+PC9wYXRoPgogICAgPHBhdGggZD0iTTIzMi43NDMgMjE1LjlMMjY2LjY5MyAyNTAuMDJDMjc3LjUwMiAyNjAuODgzIDI5NS4wMTggMjYwLjg4MyAzMDUuODEyIDI1MC4wMkwzMzkuNzYyIDIxNS45TDI4Ni4yNTMgMTYyLjEyM0wyMzIuNzQzIDIxNS45WiI+PC9wYXRoPgogIDwvZz4KPC9zdmc+)](https://datalab.sspcloud.fr/launcher/ide/jupyter-python?name=istex-tei-images&version=2.5.2&s3=default&init.personalInit=%E2%88%BChttps%3A%2F%2Fraw.githubusercontent.com%2Feonm-pro%2Fistex-tei-images%2Frefs%2Fheads%2Fmain%2Finit.sh%E2%88%BD&git.name=%E2%88%BC%E2%88%BD&git.email=%E2%88%BC%E2%88%BD&git.repository=%E2%88%BChttps%3A%2F%2Fgithub.com%2Feonm-pro%2Fistex-tei-images%E2%88%BD&autoLaunch=false)
[![Static Badge](https://img.shields.io/badge/Github%20Template-Utiliser%20ce%20dépôt%20comme%20modèle-green?logo=github)](https://github.com/new?template_name=istex-tei-images&template_owner=eonm-pro)
## À propos

Ce projet vise à **produire des statistiques sur l'usage des images dans ISTEX**. Il extrait les URLs d'images référencées dans les fichiers TEI du corpus, les charge dans une base DuckDB, puis calcule des indicateurs par document et à l'échelle du corpus :

- La part des documents qui référencent au moins une image.
- Le nombre d'images par document (moyenne, minimum, maximum).
- La part des doublons, avec le nombre d'images distinctes.
- Le nombre de balises `<graphic>` sans URL exploitable.

Les données brutes sont conservées sans filtrage, afin que les références vides puissent être comptées.

## Prérequis

### Pour l'extraction à distance
Les outils suivants doivent être disponibles sur la machine distante (ex: serveur où se trouve le corpus ISTEX) :
- **xmlstarlet** (traitement XML)
- **gzip** (compression)
- **bash**

### Pour l'analyse locale
Les outils suivants doivent être installés sur votre machine locale :
- **[DuckDB](https://duckdb.org/)** (CLI)
- **make**

> **Important** : L'extraction doit être réalisée à distance car les fichiers TEI ne sont pas accessibles localement. L'analyse doit être réalisée localement car DuckDB n'est pas disponibles sur les machines distantes.

## Utilisation

### 1. Extraction à distance
L'extraction **doit être réalisée sur la machine distante** où se trouve le corpus ISTEX.

**Commande :**
```bash
make extract CORPUS_DIR=$CORPUS_OUTPUT
```

La variable `$CORPUS_OUTPUT` est déjà définie sur la machine distante.

> Par défaut, le fichier TSV compressé sera généré dans `/tmp/images_tei.tsv.gz`.

### 2. Récupération du fichier TSV et analyse locale

Une fois l'extraction terminée, exécutez les commandes suivantes **sur votre machine locale** :

```bash
# Définissez TSV_GZ_FILE pour le fichier local
export TSV_GZ_FILE=./images_tei.tsv.gz

# Récupérez le fichier depuis la machine distante vers l'emplacement local défini
scp utilisateur@serveur-distant:/tmp/images_tei.tsv.gz $TSV_GZ_FILE

# Lancez l'analyse locale
make create_db
make export
```

## Cibles Makefile

| Cible          | Description                                                                 | Exécution       |
|----------------|-----------------------------------------------------------------------------|-----------------|
| `make extract` | Extrait les URLs d'images vers le TSV compressé                            | Distance        |
| `make create_db` | Crée et initialise la base DuckDB à partir du TSV                         | Local           |
| `make export`  | Exporte les résultats d'analyse en CSV (`analysis_results.csv`)          | Local           |
| `make clean`   | Supprime les fichiers générés (`TSV_GZ_FILE`, `tei_images.db`, `analysis_results.csv`) | Local |


## Modèle de données

### `tei_image_references` (Table brute)

| Colonne         | Description                                      |
|-----------------|--------------------------------------------------|
| `document_path` | Chemin du document source (ex: `/0/3/1/.../fulltext/xxx.tei.xml`). |
| `image_url`     | URL de l'image telle que lue dans le TSV. Peut être NULL, vide ou contenir des espaces. |


### `tei_image_references_clean` (Vue)

| Colonne          | Description                                      |
|------------------|--------------------------------------------------|
| `document_path`  | Identique à la table source.                      |
| `image_url_raw`  | Valeur brute de `image_url`.                      |
| `image_url`      | Valeur nettoyée : espaces de début et de fin supprimés (y compris `\r` et tabulations). NULL si la valeur est NULL, vide ou composée uniquement de blancs. |


### `document_image_analysis` (Vue, une ligne par document)

| Colonne                  | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `document_path`          | Chemin du document.                                                         |
| `total_reference_count`  | Nombre total de références (lignes) pour ce document, vides comprises.     |
| `image_count`            | Nombre de références avec une URL **non vide**, doublons inclus.           |
| `empty_image_count`      | Nombre de références avec une URL NULL ou vide.                           |
| `unique_image_count`     | Nombre d'URLs **distinctes et non vides**.                                  |
| `avg_images_per_doc`     | Moyenne globale de `image_count` sur tous les documents.                   |
| `max_images_per_doc`     | Maximum global de `image_count` sur un document.                           |
| `min_images_per_doc`     | Minimum global de `image_count` sur un document.                           |


### `global_image_stats` (Vue, une seule ligne)

| Colonne                  | Description                                      |
|--------------------------|--------------------------------------------------|
| `documents_total`        | Nombre de `document_path` distincts, que leurs images soient vides ou non. |
| `documents_with_images`  | Nombre de documents ayant au moins une URL non vide. |
| `total_reference_rows`   | Nombre total de références (lignes) dans `tei_image_references_clean`. |
| `total_image_calls`      | Nombre total de références avec une URL non vide, doublons inclus. |
| `empty_image_rows`       | Nombre total de références avec une URL NULL ou vide (`total_reference_rows - total_image_calls`). |
| `unique_images`          | Nombre d'URLs distinctes et non vides dans toute la base. |


### `images_extensions` (Vue, une ligne par extension)

| Colonne       | Description                                      |
|---------------|--------------------------------------------------|
| `extension`    | Extensions des images (top 10).                 |
| `nb`          | Nombre d'images.                                  |


## Exemples de requêtes SQL

Pour interroger la base DuckDB localement :
```bash
duckdb tei_images.db
```

### Requêtes utiles
1. **Nombre de documents avec des images** :
   ```sql
   SELECT documents_with_images FROM global_image_stats;
   ```

2. **Top 10 des documents avec le plus d'images** :
   ```sql
   SELECT document_path, image_count
   FROM document_image_analysis
   ORDER BY image_count DESC
   LIMIT 10;
   ```

3. **Nombre d'images uniques par extension** :
   ```sql
   SELECT extension, nb
   FROM images_extensions
   ORDER BY nb DESC;
   ```

4. **Documents avec des balises `<graphic>` vides** :
   ```sql
   SELECT document_path, empty_image_count
   FROM document_image_analysis
   WHERE empty_image_count > 0
   ORDER BY empty_image_count DESC;
   ```
