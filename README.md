---
title: Image recongnation. Mountain pics
emoji: ⛰️ 
colorFrom: green
colorTo: red
license: apache-2.0
---

## I. Directory 

- yolov5
- fast_api 

## II. Display the application in production  

### 1/ Download the project directory in your computer 

gh repo clone Izaia64/Mountainimages

Create your .env file 

`#GCP Project`

`GCP_PROJECT_WAGON=my_project_gcp`

`#Your personal GCP project for this bootcamp`

`GCP_PROJECT=my_project_gcp`
`GCP_PROJECT_ID=my_project_gcp`
`GCP_REGION=europe-west1`
`DOCKER_REPO_NAME=my_docker_repo_name`

`DOCKER_IMAGE_NAME=my_image_name`

1/ Test locally the API

`pip install requirements/txt .`

`pip install requirements_api/txt .` 

`cd fast_api` 

`uvicorn api:app --host 0.0.0.0 --port 8080`

### 2/ Build your docker image 

`docker build -t my_image `

### 3/ Run locally 

 `docker run -p 8090:8080 -it my_image sh`

### 4/ Create your image ready for Google Artefact registery 

`docker build -t $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$DOCKER_REPO_NAME/$DOCKER_IMAGE_NAME:0.1 .`

### 5/ Put your image to artefact registery 
`docker push $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$DOCKER_REPO_NAME/$DOCKER_IMAGE_NAME:0.1`

### 6/ Deploy your image on cloud run 
`gcloud run deploy --image $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$DOCKER_REPO_NAME/$DOCKER_IMAGE_NAME:0.1 --region $GCP_REGION`
     

## III. Mountain love? Fine tune the model with the moutnains you visit 

