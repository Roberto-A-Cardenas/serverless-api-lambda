resource "aws_dynamodb_table" "lambda_logs" {
  name         = "lambda_logs"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "request_id"

  attribute {
    name = "request_id"
    type = "S"
  }

  tags = {
    Project = "ServerlessAPI"
  }
}
