FROM squidfunk/mkdocs-material:7.3.3
RUN pip install mkdocs-print-site-plugin mkdocs-img2fig-plugin 
WORKDIR /doc
##ENV PYTHONUNBUFFERED 1
#
#
##RUN apk update \
##    && apk --update --upgrade --no-cache add cairo-dev pango-dev gdk-pixbuf-dev \
##    && apk --update --upgrade --no-cache add libsass
#
## Headless Chrome
##RUN apk --update --upgrade --no-cache add udev chromium \
##    && chromium-browser --version
#
#RUN set -ex \
#    && apk add --no-cache --virtual .build-deps \
#        musl-dev g++ jpeg-dev zlib-dev libffi-dev libsass-dev \
#    && SYSTEM_SASS=1 pip install \ 
#    # python package to install : 
#       mkdocs-print-site-plugin mkdocs-img2fig-plugin \
#    && apk del .build-deps
#
#
#
EXPOSE 8000
ENTRYPOINT ["mkdocs"]