provider "aws" {
  region = "us-east-1"
}

### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = "khatrig-githubaction"
    key = "lambda-test.tfstate"
    region = "us-east-1"
  }
}

####
resource "aws_iam_role_policy" "lambda-policy" {
  name         = "lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"
  description  = "AWS IAM Policy for managing aws lambda role"
  policy = "${file("iam/lambda-policy.json")}"
}

resource "aws_iam_role" "lambda_role" {
name   = "lambda_role"
assume_role_policy = "${file("iam/lambda-assume-policy.json")}"
}
