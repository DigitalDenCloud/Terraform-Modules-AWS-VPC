# Store the Terraform State File in S3 and Lock with DynamoDB
terraform {
  backend "s3" {
    bucket         =
    key            =
    region         =
    profile        =
    dynamodb_table =
  }
}