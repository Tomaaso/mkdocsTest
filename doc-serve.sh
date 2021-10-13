#!/bin/bash
bash build_docker.sh

#bash changelog.sh
docker run --rm -p 8000:8000 -e PDF_ENABLED=0 -v ${PWD}:/doc docker_mkdoc serve --dev-addr="0.0.0.0:8000"

