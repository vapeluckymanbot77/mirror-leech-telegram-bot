FROM ubuntu:22.04

WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]
RUN chmod 777 /usr/src/app

RUN apt -qq update

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata


RUN apt -qq install -y git aria2 wget curl busybox unzip unrar tar python3 ffmpeg python3-pip
RUN wget https://rclone.org/install.sh
RUN bash install.sh

RUN mkdir /app/gautam
RUN wget -O /app/gautam/gclone.gz https://git.io/JJMSG
RUN gzip -d /app/gautam/gclone.gz
RUN chmod 0775 /app/gautam/gclone

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en"

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash","start.sh"]
