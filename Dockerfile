####### 👇 OPTIMIZED SOLUTION (x86)👇 #######

# tensorflow base-images are optimized: lighter than python-buster + pip install tensorflow
FROM tensorflow/tensorflow:2.10.0

# OR for apple silicon, use this base image instead
#FROM armswdev/tensorflow-arm-neoverse:r22.09-tf-2.10.0-eigen


COPY fast_api /fast_api
COPY yolov5 /yolov5


# We strip the requirements from useless packages like `ipykernel`, `matplotlib` etc...
COPY requirements_api.txt requirements_api.txt
COPY requirements.txt requirements.txt

RUN pip install -r requirements_api.txt
RUN pip install -r requirements.txt

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

#USER root
#RUN apt-get update
#RUN apt-get install -y ffmpeg libsm6 libxext6

# Création d'un utilisateur non-root


# Utilisation de l'utilisateur non-root

WORKDIR /fast_api

CMD uvicorn api:app --host 0.0.0.0 --port 8080
