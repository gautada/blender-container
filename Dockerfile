# FROM alpine:3.13 as config-alpine

# RUN apk add --no-cache tzdata
 
# RUN cp -v /usr/share/zoneinfo/America/New_York /etc/localtime
# RUN echo "America/New_York" > /etc/timezone
# 
# FROM alpine:3.13 as src-flamenco-manager
# 
# RUN apk add --no-cache build-base go git python3
# RUN git config --global advice.detachedHead false
# RUN git clone --branch=v2.5 --depth=1 git://git.blender.org/flamenco-manager.git
# WORKDIR /flamenco-manager
# RUN go build -i -v -o flamenco-manager -ldflags="-X main.applicationVersion="  github.com/armadillica/flamenco-manager
#  
# FROM alpine:edge
# 
# COPY --from=config-alpine /etc/localtime /etc/localtime
# COPY --from=config-alpine /etc/timezone  /etc/timezone
# COPY --from=src-flamenco-manager /flamenco-manager/flamenco-manager /usr/bin/flamenco-manager
# 
# RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# RUN cat /etc/apk/repositories
# RUN apk add --no-cache blender git python3 py3-pip
# RUN git config --global advice.detachedHead false
# RUN git clone --branch=v2.5 --depth=1 git://git.blender.org/flamenco-worker.git
# RUN pip install attrs pyjwt

# RUN git clone --branch=v2.5 --depth=1 git://git.blender.org/flamenco-manager.git

# CMD ["tail", "-f", "/dev/null"]


FROM ubuntu:18.04

RUN apt-get update
 
RUN DEBIAN_FRONTEND="noninteractive" apt-get install --yes gnupg wget
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update
RUN lsb_release -dc
RUN DEBIAN_FRONTEND="noninteractive" apt-get install --yes mongodb-org-shell mongodb-org-server mongodb-org-mongos mongodb-org
# 
# RUN add-apt-repository ppa:irie/blender
# 
# RUN apt-get update
# 
# RUN apt-get install blender
# 
#  build-essential \
#  git \
#  subversion \
#  cmake \
#  sudo  
 
# libx11-dev libxxf86vm-dev libxcursor-dev libxi-dev libxrandr-dev libxinerama-dev libglew-dev
# 
# RUN git config --global advice.detachedHead false                                                                                                                       
# RUN git clone --branch v2.91.2 --depth=1 https://github.com/blender/blender.git

# RUN snap install blender --classic
# WORKDIR /blender
# RUN /blender/build_files/build_environment/install_deps.sh \
#  --no-confirm --no-build
# --no-sudo 

# RUN make update





# FROM alpine:3.13 as config-alpine
# 
# RUN apk add --no-cache tzdata
# 
# RUN cp -v /usr/share/zoneinfo/America/New_York /etc/localtime
# RUN echo "America/New_York" > /etc/timezone
#  
# FROM alpine:edge
# 
# RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# RUN cat /etc/apk/repositories
# RUN apk add --no-cache blender

# 
# RUN apk add build-base git cmake subversion libx11-dev libxxf86vm-dev libxi-dev libxrandr-dev glew-dev jpeg-dev libpng-dev freetype-dev
# 
# RUN git config --global advice.detachedHead false
# RUN git clone --branch v2.91.2 --depth=1 https://github.com/blender/blender.git
# 
# RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
# RUN apk add --no-cache blender














# FROM alpine:3.13
# 
# RUN apk add --no-cache tzdata
#  
# RUN cp -v /usr/share/zoneinfo/America/New_York /etc/localtime
# RUN echo "America/New_York" > /etc/timezone
# 
# RUN apk add alpine-sdk sudo
# RUN addgroup builder
# RUN adduser -D -s /bin/sh -G builder builder
# RUN echo "builder    ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
# USER builder
# WORKDIR /home/builder
# RUN git config --global user.name "Docker Builder"
# RUN git config --global user.email "your@email.address"
# 
# RUN git clone https://gitlab.alpinelinux.org/alpine/aports
# RUN sudo addgroup builder abuild
# CMD ["tail", "-f", "/dev/null"]
