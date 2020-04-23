#! /bin/bash

buckets=(
  aws-codestar-eu-west-1-750639270376-test-en-pipe
  frontend-cleanup-pipelinestac-artifactstorebucket-1a1lqut4i2a3v
  frontend-codereview-3-pipelin-artifactstorebucket-7s9c29rhnt9o
  frontend-codereview-4-bucket
  frontend-codereview-4-pipelin-artifactstorebucket-1gj2v8e7p8d1n
  frontend-codereview-bucket
  frontend-codereview-pipelines-artifactstorebucket-1k9nrbudp0efb
  frontend-develop-pipelinestac-artifactstorebucket-1ozpnllthrlv3
  frontend-develop-pipelinestac-artifactstorebucket-1phals6q1btny
  frontend-develop-pipelinestac-artifactstorebucket-1qdzpqjljsre5
  frontend-en-sg-pipelinestack-artifactstorebucket-2it5lary113v
  frontend-mockdata-pipelinesta-artifactstorebucket-14edr1fmofe87
  frontend-nested-stack-artifactstorebucket-1d52w113wk6cf
  frontend-pipeline-bucket
  frontend-pipeline-pipelinesta-artifactstorebucket-2hjv39a1c5xl
  frontend-pipelinestack-uutg5r-artifactstorebucket-17b28gjca0fz8
  frontend-s3-frontendbucketstack-1s-frontendbucket-11reo3zrsssoc
  frontend-s3-pipelinestack-2uk-artifactstorebucket-hkdkw2ben7i5
  frontend-s3-pipelinestack-dcm-artifactstorebucket-185hku4opgau8
  frontend-s3-pipelinestack-rkp-artifactstorebucket-1c0bk3c57apml
  frontend-stack-artifactstorebucket-17eqk9m2oyhi7
  frontend-stack-complete-6-artifactstorebucket-djymoo3cwacw
  frontend-test-1-artifactstorebucket-2iusxnouxfie
  frontend-test-pipelinestack-1-artifactstorebucket-138vaqjlz3hav
  frontend-test-pipelinestack-1-artifactstorebucket-ufttj4ugzy4j
  frontend-test-pipelinestack-a-artifactstorebucket-r97bu6ri7kdp
  frontend-test-pipelinestack-c-artifactstorebucket-1hfwnkgeznlt6
  invalid-pipelinestack-10s3ibk-artifactstorebucket-1cu3vu9n2x4n4
  invalid-pipelinestack-11q0s1m-artifactstorebucket-toxq1txc8thg
  invalid-pipelinestack-1s56or7-artifactstorebucket-17xw70uq9v6di
  invalid-pipelinestack-1u3gitq-artifactstorebucket-j5shy0jvwuxi
  invalid-pipelinestack-8b7ul6e-artifactstorebucket-mij9ij2xjjsg
  invalidation-frontendbucketstack-1-frontendbucket-au16tg1wrmmz
  invalidation-pipelinestack-10-artifactstorebucket-1gwfbm2950jeo
  invalidation-pipelinestack-10-artifactstorebucket-ybjag3a7w16o
  invalidation-pipelinestack-1d-artifactstorebucket-16yqbdf1zvka5
  invalidation-pipelinestack-1i-artifactstorebucket-1nndla7bv1sf6
  invalidation-pipelinestack-1w-artifactstorebucket-1bf0knka9l41e
  invalidation-pipelinestack-1w-artifactstorebucket-61pf6j10pen6
  invalidation-pipelinestack-3x-artifactstorebucket-1irpigo31zdvd
  invalidation-pipelinestack-4j-artifactstorebucket-1f6bri1892hav
  invalidation-pipelinestack-6x-artifactstorebucket-hku35yq92zhl
  invalidation-pipelinestack-7x-artifactstorebucket-1jgthd2ba3qy
  invalidation-pipelinestack-9b-artifactstorebucket-ou7jnyah2d7z
  invalidation-pipelinestack-bh-artifactstorebucket-wvxz30pcsszd
  invalidation-pipelinestack-hs-artifactstorebucket-1glihzdypmgct
  invalidation-pipelinestack-ip-artifactstorebucket-1ptixkajozco
  invalidation-pipelinestack-la-artifactstorebucket-1kdtf04so5m5x
  invalidation-pipelinestack-p1-artifactstorebucket-1bisoibzph1f8
  invalidation-pipelinestack-ye-artifactstorebucket-15zqyy2wtzcnb
  nva-en-sg-bucket
  nva-en-sg-pipelinestack-1rgvs-artifactstorebucket-vn21v6xjhf5g
  nva-fetch-resource-test
  nva-frontend-deploy
  nva-frontend-en-sg
  nva-frontend-en-sg-pipelinest-artifactstorebucket-styov87yvd77
  nva-frontend-invalidation-pip-artifactstorebucket-1i2awcxci1jo6
  nva-frontend-invalidation-pip-artifactstorebucket-1p6e2h3vkbmbs
  nva-frontend-invalidation-pip-artifactstorebucket-rt8ll703mymy
  nva-frontend-invalidation-pip-artifactstorebucket-tw5l3g34j2b1
  nva-frontend-pipeline-artifactstorebucket-17z1q7r9gsfc3
  nva-frontend-sg-en-bucket
  nva-frontend-sg-en-pipelinest-artifactstorebucket-zc6mg2hc5nl9
  nva-frontend-stack-artifactstorebucket-1s75pq1chr41v
  nva-frontend-stack-bucket-frontend-stack-complete-4-bucket
  nva-frontend-stack-complete-2-artifactstorebucket-1xtb1ed5cy4vg
  nva-frontend-stack-complete-artifactstorebucket-1l3p4u8c2bqse
  nva-frontend-stack-final-artifactstorebucket-t0wcvhduynct
  nva-frontend-test-en-sg
  nva-frontend-test-en-sg-pipel-artifactstorebucket-16hvaf5qn4kb2
)

#buckets=(
#  nva-frontend-stack-complete-artifactstorebucket-1l3p4u8c2bqse
#)

for bucket_name in "${buckets[@]}"; do
#  echo "aws s3 rm + rb s3://${bucket_name} --force --recursive"
  echo delete ${bucket_name}
  python3 delete_bucket.py ${bucket_name}
#  aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Suspended
#  aws s3api put-bucket-lifecycle-configuration --bucket ${bucket_name} --lifecycle-configuration file://lifecycle.json
#  aws s3api delete-objects --bucket ${bucket_name} --delete "$(aws s3api list-object-versions --bucket "${bucket_name}"  --output=json   --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
  #  aws s3 rm s3://$bucket --recursive
  #  aws s3 rb s3://$bucket --force
done
