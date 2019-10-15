#!/bin/bash

#Checking if Bucker already exist else Creating Buckets

S3_SRC_BUCKET="my-cli-nv-image-bkt"
S3_DEST_BUCKET="my-cli-nv-image-bkt-resized"
FUNC_NAME="Create-Jenkins-Thumbnail"

if aws s3 ls "s3://$S3_SRC_BUCKET" 2>&1 | grep -q "$S3_SRC_BUCKET"
then 
echo "Bucket already exists"
else
aws s3api create-bucket --bucket $S3_SRC_BUCKET --region us-east-1
fi

if aws s3 ls "s3://$S3_DEST_BUCKET" 2>&1 | grep -q "$S3_DEST_BUCKET"
then 
echo "Bucket already exists"
else
aws s3api create-bucket --bucket $S3_DEST_BUCKET --region us-east-1
fi

#Creating Lambda Function

aws lambda get-function --function-name $FUNC_NAME > /dev/null 2>&1
if [ 0 -eq $? ]; then
    echo "Lambda '$1' exists"
  else
    echo "Creating the Lambda fucntion"
    
    aws lambda create-function --function-name Create-Jenkins-Thumbnail --runtime python3.7 --role arn:aws:iam::547369373092:role/my-lambda-to-S3-read-write-role --handler CreateThumbnail.handler --zip-file fileb://CreateThumbnail.zip
    
  fi
