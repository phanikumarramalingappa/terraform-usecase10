resource "aws_api_gateway_rest_api" "main" {
  name        = "appointment-patient-api"
  description = "API Gateway for appointment and patient services"
}

resource "aws_api_gateway_resource" "appointments" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "appointments"
}

resource "aws_api_gateway_resource" "patients" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "patients"
}

resource "aws_api_gateway_authorizer" "cognito" {
  name            = "cognito-authorizer"
  rest_api_id     = aws_api_gateway_rest_api.main.id
  identity_source = "method.request.header.Authorization"
  type            = "COGNITO_USER_POOLS"
  provider_arns   = [var.user_pool_arn]
}

resource "aws_api_gateway_method" "appointments_get" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.appointments.id
  http_method   = "GET"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito.id
}

resource "aws_api_gateway_method" "patients_get" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.patients.id
  http_method   = "GET"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito.id
}

resource "aws_api_gateway_vpc_link" "internal_alb_link" {
  name        = "internal-alb-vpc-link"
  target_arns = [var.internal_alb_arn]
}

resource "aws_api_gateway_integration" "appointments_integration" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.appointments.id
  http_method             = aws_api_gateway_method.appointments_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${var.internal_alb_dns}/appointments"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.internal_alb_link.id
}

resource "aws_api_gateway_integration" "patients_integration" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.patients.id
  http_method             = aws_api_gateway_method.patients_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${var.internal_alb_dns}/patients"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.internal_alb_link.id
}

resource "aws_api_gateway_deployment" "main" {
  depends_on = [
    aws_api_gateway_integration.appointments_integration,
    aws_api_gateway_integration.patients_integration
  ]
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_stage" "prod" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.main.id
  deployment_id = aws_api_gateway_deployment.main.id
}
