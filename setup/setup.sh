#!/bin/sh

aws s3api create-bucket --region ap-northeast-1 \
--create-bucket-configuration LocationConstraint=ap-northeast-1 \
--bucket "tfstate-bucket-idpos" \
--profile fogefoge
aws s3api put-bucket-versioning \
--bucket "tfstate-bucket-idpos" \
--versioning-configuration Status=Enabled \
--profile fogefoge
aws s3api get-bucket-versioning \
--bucket "tfstate-bucket-idpos" \
--profile fogefoge
aws s3api put-public-access-block \
--bucket "tfstate-bucket-idpos" \
--public-access-block-configuration \
BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true \
--profile fogefoge
aws s3api get-public-access-block \
--bucket "tfstate-bucket-idpos" \
--profile fogefoge
aws s3api put-bucket-encryption \
--bucket "tfstate-bucket-idpos" \
--server-side-encryption-configuration "{\"Rules\":[{\"ApplyServerSideEncryptionByDefault\":{\"SSEAlgorithm\":\"AES256\"}}]}" \
--profile fogefoge
aws s3api get-bucket-encryption \
--bucket "tfstate-bucket-idpos" \
--profile fogefoge
aws s3api put-bucket-tagging \
--bucket "tfstate-bucket-idpos" \
--tagging "TagSet=[{Key=Environment,Value=fogefoge}]" \
--profile fogefoge
aws s3api get-bucket-tagging \
--bucket "tfstate-bucket-idpos" \
--profile fogefoge
aws dynamodb create-table --table-name "terraform_state_lock" \
--attribute-definitions "[{\"AttributeName\":\"LockID\", \"AttributeType\": \"S\"}]" \
--key-schema "[{\"AttributeName\":\"LockID\", \"KeyType\": \"HASH\"}]" \
--provisioned-throughput "{\"ReadCapacityUnits\": 1, \"WriteCapacityUnits\": 1}" \
--profile fogefoge
