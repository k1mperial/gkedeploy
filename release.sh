# !/bin/bash
set -e
echo "Deploying to ${DEPLOYMENT_ENVIRONMENT}"
echo "$SERVICE_ACCOUNT_KEY" > key.json
gcloud auth activate-service-account --key-file=key.json
gcloud config set project $PROJECT_ID
gcloud --quiet config set container/cluster $CLUSTER_NAME
gcloud config set compute/zone $CLOUDSDK_COMPUTE_ZONE
gcloud --quiet container clusters get-credentials $CLUSTER_NAME
gcloud docker -- push $DOCKER_IMAGE_TAG
# Do the deployment
cat deployment.yaml | envsubst | kubectl apply -f -
echo " Successfully deployed to ${DEPLOYMENT_ENVIRONMENT}"