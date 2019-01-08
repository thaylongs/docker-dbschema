docker run -d --rm -it  -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/dbschema:$HOME/dbschema -e DISPLAY=unix$DISPLAY --name dbschema thaylon/docker-dbschema8.1
