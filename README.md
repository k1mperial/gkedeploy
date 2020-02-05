# CI/CD for Node.js using Gitlab, Kubernetes, and Docker with deployment to Google Kubernetes Engine

1. I cloned a simple node app that serves a static HTML page. It also has a test that confirms a status 200 once the server is up and running <br />
2. Dockerized the app. Configured the pipeline <br />
3. Build Stage: Login to the Gitlab Container Registry and pull the previously pushed image. Build and tag the new image, then push again to the Gitlab Container Registry <br />
5. Test Stage: Used the image created in the Build stage to run the test on the node server. I had to override the entrypoint in the gitlab-ci.yml file in order to run the test <br />
6. Publish Stage: Pushed the image from the Build stage on to the Google Container Registry. This will be used for the Google Kubernetes Engine deployment. Used a service account for authentication <br />
7. Deploy Stage: Create a deployment in GKE using the image from the Publish stage <br />
8. Check this site to view the pipeline status for the last deploy: <br />

https://gitlab.com/karen.c.imperial/nodeapp/pipelines <br />

