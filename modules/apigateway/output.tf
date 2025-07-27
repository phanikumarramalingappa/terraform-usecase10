output "rest_api_id" {
  value = aws_api_gateway_rest_api.main.id
}

data "aws_region" "current" {}

output "api_gateway_url" {
  value = "https://${aws_api_gateway_rest_api.main.id}.execute-api.${data.aws_region.current.id}.amazonaws.com/${aws_api_gateway_stage.prod.stage_name}"
}

output "authorizer_id" {
  value = aws_api_gateway_authorizer.cognito.id
}
