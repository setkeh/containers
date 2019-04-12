#!/bin/bash

export creds=$(aws sts assume-role --role-arn ${ASSUMED_ROLE} --role-session-name AWSCLI-Session)
export AWS_ACCESS_KEY_ID=$(echo $creds| jq -r ".Credentials | .AccessKeyId")
export AWS_SECRET_ACCESS_KEY=$(echo $creds| jq -r ".Credentials | .SecretAccessKey")
export AWS_SESSION_TOKEN=$(echo $creds| jq -r ".Credentials | .SessionToken")
terraform init /work/nonprod && \
terraform plan -o /work/out/plan-${BUILDKITE_BUILD_NUMBER} ${WORK_DIR}/nonprod