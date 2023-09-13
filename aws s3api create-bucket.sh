# S3 Bucket for storing Terraform State
aws s3api create-bucket \
  --bucket digitalden-terraform-tfstate \
  --profile terraform-user