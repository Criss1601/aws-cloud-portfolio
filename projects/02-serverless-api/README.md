# Serverless REST API on AWS (Simulated with LocalStack & Terraform)

Professional cloud engineering project showcasing a fully automated, serverless REST API built with Infrastructure as Code (IaC) and cloud-native services.

## 🚀 Architecture & Tech Stack
* **Infrastructure as Code (IaC):** Terraform (`v1.5+`)
* **Compute:** AWS Lambda (Python 3.11)
* **API Routing:** Amazon API Gateway (HTTP/REST Proxy)
* **Database:** Amazon DynamoDB (On-demand billing mode)
* **Local Cloud Emulation:** LocalStack (`v3.8.0`) running via Docker
* **OS Environment:** Debian Linux

## 🛠️ Project Structure
```text
02-serverless-api/
├── apigateway.tf       # API Gateway REST API, resources, methods, and integrations
├── dynamodb.tf         # DynamoDB table configuration (PAY_PER_REQUEST)
├── iam.tf              # IAM roles and security policies for Lambda execution
├── lambda.tf           # Lambda function resource, packaging, and environment vars
├── outputs.tf          # Output endpoints (API Gateway invocation URL)
├── providers.tf        # Terraform AWS provider configured for LocalStack endpoints
├── variables.tf        # Input variables definition
└── src/
    └── index.py        # Python backend handler for CRUD operations
