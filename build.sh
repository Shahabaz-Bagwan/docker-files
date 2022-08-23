#!/bin/bash

# color ref https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${RED}Run this only from docker folder${NC}"

NAME="docker-container"
echo "Enter container name, def: 'docker-container'"
read NAME

echo "building docker image.... "
docker build -t $NAME:1.0 .

echo -e "select directory to mount in container: \
\n0 for present directory and 1 for parent directory \
\n default present directory"
SEL=-1
read sel
if [ $SEL -ne 0 ]
then
	DIR=$(dirname `pwd`)
else
	DIR=$(pwd)
fi
echo $DIR

echo "running the container.."
docker run -d -it --name $NAME --mount type=bind,source=$DIR,target=/projects $NAME:1.0 && check=1
