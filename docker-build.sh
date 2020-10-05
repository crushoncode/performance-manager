#!/bin/sh
docker build . -t dancing-manager
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 dancing-manager"
