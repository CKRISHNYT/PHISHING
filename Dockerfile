FROM alpine:latest
LABEL MAINTAINER="https://github.com/CKRISHNYT/PHISHER"
WORKDIR /PHISHER/
ADD . /PHISHER
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./PHISHER.sh"
