# Back-end-Development-Capstone

SoundStage is an independent Django capstone application integrating Flask Songs and Pictures services. The full source tree, including config/, website/, songs/, photos/, templates/, and generated migrations, is preserved in source.zip. It is packaged as an archive to retain the directory structure during browser upload.

## Run locally

    python -m zipfile -e source.zip app
    cd app
    python -m pip install -r requirements.txt
    python manage.py migrate
    python manage.py runserver 0.0.0.0:8000

Set SONGS_URL and PICTURES_URL to running Flask services (defaults http://localhost:5002 and http://localhost:5001). Songs/Photos pages fetch those APIs; Django stores Concert, Song and Photo models in SQLite. The templates include an actual Bootstrap Lyrics modal.

## Docker

The root Dockerfile extracts the same source tree before installing dependencies:

    docker build -t soundstage-django .
    docker run --rm -p 8000:8000 -e SONGS_URL=http://host.docker.internal:5002 -e PICTURES_URL=http://host.docker.internal:5001 soundstage-django

For persistence, mount a directory and set DJANGO_DB_PATH=/data/db.sqlite3. Do not use --rm without a persistent database when storing real records.

## Checks performed locally

Django system checks passed. Initial migrations for songs.Song and photos.Photo were generated and applied successfully. Home, Songs, Photos, and Concerts return HTTP 200 in the running local application. This README does not claim cloud deployment or a successful image rebuild.

## Course evidence

Public README URL for Task 11: https://github.com/tatarpower69/Back-end-Development-Capstone/blob/main/README.md

Screenshots and command transcripts must come from actual executions. Cloud tasks still require an authenticated course cloud laboratory.
