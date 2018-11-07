export INSTANCE_NAME="$1"

gcloud compute ssh $INSTANCE_NAME -- -L 8080:localhost:8080
