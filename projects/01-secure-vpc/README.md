# Proyecto 01: Arquitectura de Red Segura (VPC) en AWS con Terraform

## Descripción
Este proyecto despliega una infraestructura de red altamente disponible y segura en AWS utilizando Terraform. Separa los recursos en capas públicas y privadas siguiendo las mejores prácticas de arquitectura de la nube.

## Componentes
- **1 VPC** con soporte de nombres DNS (`10.0.0.0/16`).
- **1 Internet Gateway** para el tráfico de salida/entrada a internet.
- **2 Subredes Públicas** (para balanceadores de carga o recursos expuestos).
- **2 Subredes Privadas** (para bases de datos o servicios backend aislados).
- **Tablas de Rutas y Asociaciones** automatizadas.