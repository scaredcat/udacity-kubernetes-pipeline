buildtag=$(git rev-parse --short HEAD)
docker build . --tag scaredcat/udacity-kube:$buildtag
docker run --rm -p 80:80 scaredcat/udacity-kube:$buildtag