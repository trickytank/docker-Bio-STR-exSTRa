# Build that docker container

mkdir -p  context

docker build -t bio-str-exstra:1.0.2 -f dockerfiles/Dockerfile context

docker tag 9f676bd305a4 ubuntu:13.10
