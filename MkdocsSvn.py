import os
import argparse

#Docker command
serveCmd='docker run --rm -p 8000:8000 -e PDF_ENABLED=0 -v ${PWD}:/doc docker_mkdoc serve'
buildCmd='docker run --rm -e PDF_ENABLED=1 -v ${PWD}:/doc docker_mkdoc build'

parser = argparse.ArgumentParser()
parser.add_argument("mode",help="Mkdocs mode, Serve or build")

args = parser.parse_args()

def UpdateChangelog():
  log = os.popen('svn log').read()
  print(log)

  log = log.replace("------------------------------------------------------------------------\n","##### ")
  print(log)

  with open("docs/changelog.md",'w') as f:
    f.write(log)

if args.mode == "serve":
  os.system(serveCmd)
elif args.mode == "build":
  os.system((buildCmd))
elif args.mode == "commit":
  pass





