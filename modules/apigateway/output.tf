output "rest_api_id" {
  value = aws_api_gateway_rest_api.main.id
}

output "api_gateway_url" {
  value = aws_api_gateway_deployment.main.invoke_url
}

output "authorizer_id" {
  value = aws_api_gateway_authorizer.cognito.id
}
