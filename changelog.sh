#!/bin/bash
svn log . > docs/tmp && echo "# Changelog " >> docs/tmp
if [[ $? == 0 ]]; then
  cat docs/tmp | sed ':a;N;$!ba;s/------------------------------------------------------------------------\n/#### /g' > docs/changelog.md 
else
  echo "Unpossible to access to SVN"
fi
rm docs/tmp