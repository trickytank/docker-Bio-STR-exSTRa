# Build that docker container

mkdir -p  context

VERSION=1.1.1

docker build -t ricktankard/bio-str-exstra:$VERSION -f dockerfiles/Dockerfile context

docker tag ricktankard/bio-str-exstra:$VERSION ricktankard/bio-str-exstra:latest

