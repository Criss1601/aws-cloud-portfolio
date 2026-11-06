# Proyecto 4: Monitoreo y Observabilidad Serverless en AWS

Este proyecto implementa una capa de observabilidad mediante **Amazon CloudWatch** y **Amazon SNS**, aprovisionada con **Terraform**.

## 🏗️ Arquitectura
- Alarmas de CloudWatch para errores y alta latencia en Lambda.
- Tópico SNS para notificaciones por correo electrónico.

## 🚀 Despliegue
1. `terraform init`
2. `terraform validate`
3. `terraform apply`
