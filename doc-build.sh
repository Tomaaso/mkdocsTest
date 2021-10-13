#!/bin/bash

bash build_docker.sh

#bash changelog.sh
REV_VERSION="$(svn info --show-item revision docs)"
EXIST="$(ls pdf | grep $REV_VERSION | wc -l)"
FILENAME="$(ls site | grep ".pdf" |sed 's/.pdf//g')"
docker run --rm -e PDF_ENABLED=1 -v ${PWD}:/doc docker_mkdoc build
if [[ $EXIST > 0 ]]; then 
  echo "-----"
  echo "A pdf already exist at the version ${REV_VERSION}. To generate a new PDF you should commit you modification before or delete the pdf."
  echo "You can previsualise the ouput of your pdf here : pdf/${FILENAME}_debug.pdf"
  echo "-----"
  cp site/*.pdf pdf/$FILENAME\_debug.pdf
else
  cp site/*.pdf pdf/$FILENAME\_rev_$REV_VERSION.pdf
  echo "-----"
  echo "pdf/${FILENAME}_rev_${REV_VERSION}.pdf was generated successfully !"
  echo "-----"
fi


