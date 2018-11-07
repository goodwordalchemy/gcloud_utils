if [ "$#" -ne 1 ]
then
    echo "Usage: You need to pass an instance name as an argument"
    exit 1
fi

export INSTANCE_NAME="$1"

gcloud compute \
    instances create $INSTANCE_NAME \
    --machine-type "custom-10-61440" \
    --maintenance-policy "TERMINATE" \
    --restart-on-failure \
    --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
    --accelerator "type=nvidia-tesla-p100,count=1" \
    --min-cpu-platform "Intel Broadwell" \
    --image "nvidia-gpu-cloud-image-20180816" \
    --image-project "nvidia-ngc-public" \
    --boot-disk-size "200" \
    --boot-disk-type "pd-standard" &&
