sudo docker run \
    -it \
    --runtime=nvidia \
    -p 8080:8080 \
    -u $(id -u):$(id -g) \
        tf
