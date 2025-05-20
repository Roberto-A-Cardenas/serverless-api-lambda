data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/../lambda/index.js"
  output_path = "${path.module}/../lambda/index.zip"
}

resource "aws_lambda_function" "hello_lambda" {
  function_name = "hello-lambda"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  role          = aws_iam_role.lambda_exec_role.arn
  filename      = "${path.module}/../lambda-deploy.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda-deploy.zip")
}

