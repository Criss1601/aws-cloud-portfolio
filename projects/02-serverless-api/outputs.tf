output "api_url" {
  description = "URL base del API Gateway para consumir los servicios"
  value       = "${aws_api_gateway_deployment.deployment.invoke_url}/items"
}
