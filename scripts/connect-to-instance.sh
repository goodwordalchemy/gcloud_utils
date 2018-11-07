if [ "$#" -ne 1 ]
then
  echo "Usage: Need to pass an instance name as an argument"
  exit 1
fi

export INSTANCE_NAME="$1"

gcloud compute ssh $INSTANCE_NAME -- -L 8080:localhost:8080
