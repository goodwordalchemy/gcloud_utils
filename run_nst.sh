./scripts/configure-remote-server.sh nst

until (gcloud compute scp ./scripts/run-script-on-remote-server.sh nst:~); do
    echo "failed test copy.  waiting 10 seconds"
    sleep 10
done

gcloud compute ssh nst --command "bash -s " < ./scripts/run-script-on-remote-server.sh
