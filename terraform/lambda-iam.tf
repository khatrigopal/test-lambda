####
resource "aws_iam_policy" "lambda policy" {
  name         = "lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"
  description  = "AWS IAM Policy for managing aws lambda role"
  role = "${file("iam/kambda-policy.json")}"
}

resource "aws_iam_role" "lambda_role" {
name   = "lambda_role"
assume_role_policy = "${file("iam/lambda-assume-policy.json")}"
}
