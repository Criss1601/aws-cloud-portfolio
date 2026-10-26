variable "aws_region" {
  description = "Región de AWS para desplegar los recursos serverless"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre base para los recursos del proyecto"
  type        = string
  default     = "portfolio-api"
}
