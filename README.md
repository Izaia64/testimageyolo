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

### 1/ Test the app

### Download

`gh repo clone Izaia64/Mountainimages`

### Create your .env file 

<div style="border: 1px solid #ccc; padding: 10px; background-color: #f0f0f0;"># GCP Project <br>
GCP_PROJECT_WAGON=wagon-public-datasets <br>
# Your personal GCP project for this bootcamp <br>
GCP_PROJECT=wagon-bootcamp-404319 <br>
GCP_PROJECT_ID=wagon-bootcamp-404319 <br>
GCP_REGION=europe-west1 <br>
DOCKER_REPO_NAME=imageyolo <br>
DOCKER_IMAGE_NAME=dockerimagecl1 <br>
</div>

### Launch local application

<div style="border: 1px solid #ccc; padding: 10px; background-color: #f0f0f0;"> pip install requirements/txt . <br> pip install requirements_api/txt .  <br> cd fast_api <br> uvicorn api:app --host 0.0.0.0 --port 8080 </div>

### 2/ Build your docker image 

`docker build -t my_image `

### 3/ Run locally 

 `docker run -p 8090:8080 -it my_image sh`

### 4/ Build docker image ready for Google Artefact registery 

`docker build -t $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$DOCKER_REPO_NAME/$DOCKER_IMAGE_NAME:0.1 .`

### 5/ Push your image to artefact registery 
`docker push $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$DOCKER_REPO_NAME/$DOCKER_IMAGE_NAME:0.1`

### 6/ Deploy your image on cloud run 
`gcloud run deploy --image $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$DOCKER_REPO_NAME/$DOCKER_IMAGE_NAME:0.1 --region $GCP_REGION`
     

## III. Mountain love? Fine tune the model with the moutnains you visit 

