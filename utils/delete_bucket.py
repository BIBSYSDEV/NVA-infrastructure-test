#!/usr/bin/env python

BUCKET = 'frontend-codereview-3-pipelin-artifactstorebucket-7s9c29rhnt9o'

import boto3
import sys


s3 = boto3.resource('s3')
bucket = s3.Bucket(sys.argv[1])
try:
    bucket.object_versions.delete()
except:
    print("error deleteing versions:", sys.exc_info())

# if you want to delete the now-empty bucket as well, uncomment this line:
bucket.delete()
print(bucket)