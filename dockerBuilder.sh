
COMMIT_ID=$(git rev-parse --short HEAD)
echo "Building image and updating docker-hub with new tags listed below"
echo "\t chaz003/git_runner:latest"
echo "\t chaz003/git_runner:$COMMIT_ID"



echo
echo "Enter version number here if you also want a version number tag"
read versionNum



docker build . -t git_runner --no-cache

#tag & push git commit ID
docker image tag git_runner chaz003/git_runner:$COMMIT_ID
docker image push chaz003/git_runner:$COMMIT_ID

#tag & push version number if provided
if [ "$versionNum" != "" ]; then
    docker image tag git_runner chaz003/git_runner:$versionNum
    docker image push chaz003/git_runner:$versionNum
fi

#tag & push latest
docker image tag git_runner chaz003/git_runner:latest
docker image push chaz003/git_runner:latest




