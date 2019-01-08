#
# DESCRIPTION:    Image with DbSchema
# TO_BUILD:       docker build -t thaylon/docker-dbschema8.1  --build-arg username=$USER .
# TO_RUN:         docker run -d --rm -it  -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/dbschema:$HOME/dbschema -e DISPLAY=unix$DISPLAY --name dbschema thaylon/docker-dbschema8.1

FROM openjdk:8

MAINTAINER  Alessandro Madruga Correia <mutley.sandro@gmail.com>
MAINTAINER  Thaylon Guedes Santos <thaylongs@gmail.com>

RUN apt-get update --yes --quiet && \
    apt-get install --yes --quiet --no-install-recommends wget apt-utils && \
    wget -O /tmp/dbschema.deb https://www.dbschema.com/download/DbSchema_linux_8_1_0.deb && \
    dpkg -i /tmp/dbschema.deb && \
    rm /tmp/dbschema.deb && \
    apt-get remove --yes --quiet wget apt-utils && \
    apt-get clean --yes && \
    rm -rf -- /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash $username
USER $username

CMD ["/opt/DbSchema/DbSchema"]
