From ubuntu:latest

RUN apt-get update && apt-get install -y locales && apt install -y language-pack-ko && rm -rf /var/lib/apt/lists/* \
    && localedef -i ko_KR -c -f UTF-8 -A /usr/share/locale/locale.alias ko_KR.UTF-8
ENV LANG ko_KR.utf8

RUN apt-get upgrade

RUN apt-get update && apt-get install -y vim

RUN apt-get update && apt-get install -y wget

RUN apt-get update && apt-get install -y zip

RUN apt-get update && apt-get install -y curl

RUN apt-get update && apt-get install -y gnupg2


COPY install /home/

COPY run /home/

CMD ["/bin/bash", "/home/install"]

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]

WORKDIR /home

EXPOSE 6379
EXPOSE 3306
EXPOSE 9092
EXPOSE 9000
EXPOSE 9200
EXPOSE 5601
EXPOSE 27017
