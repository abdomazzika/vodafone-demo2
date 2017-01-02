#!/bin/bash

IMAGE_NAME=$1

echo "stop the current containers based on image_name  which our app build from"
if [[ $(docker ps | grep $IMAGE_NAME | awk '{print $1}') ]]; then 
	docker rm -f $(docker ps | grep $IMAGE_NAME | awk '{print $1}') 
fi


echo "stop the current containers based on image_id which our app build from"
for image_id in `docker images -q $IMAGE_NAME`
do 
	if [[ $(docker ps | grep $image_id | awk '{print $1}') ]]; then 
		docker rm -f $(docker ps| grep $image_id | awk '{print $1}') 
	fi 
done


echo "remove the old app images"
if [[ $(docker images -q $IMAGE_NAME) ]]; then 
	docker rmi -f $(docker images -q $IMAGE_NAME) 
fi
