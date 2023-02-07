####
resource "aws_iam_policy" "lambda policy" {
  name         = "lambda_policy"
  role = "${aws_iam_role.test_role.id}"
  description  = "AWS IAM Policy for managing aws lambda role"
  role = "${file("iam/kambda-policy.json")}"
}
