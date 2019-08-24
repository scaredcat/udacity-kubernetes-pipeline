buildtag=$(git rev-parse --short HEAD)
docker build . --tag scaredcat/udacity-kube:$buildtag
docker push scaredcat/udacity-kube:$buildtag
kubectl set image deployment/udacity-deployment scaredcat/udacity-kube:$buildtag