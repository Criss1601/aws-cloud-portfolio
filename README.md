
---

## 🚀 Proyecto 3: CI/CD Pipeline para Infraestructura como Código (IaC)

### 📌 Descripción General
Implementación de un flujo de integración continua (CI) mediante **GitHub Actions** para automatizar la calidad, sintaxis y formato del código Terraform utilizado en la infraestructura serverless.

### 🛠️ Tecnologías y Herramientas
* **GitHub Actions:** Orquestador de la tubería de CI/CD.
* **HashiCorp Terraform:** Infraestructura como Código.
* **Git & GitHub:** Control de versiones y disparadores automatizados por eventos (*push* / *pull request*).

### ⚙️ Funcionalidades del Pipeline
1. **Checkout del Repositorio:** Descarga automática del código en el ejecutor de GitHub.
2. **Setup de Terraform:** Configuración del entorno de ejecución de HashiCorp.
3. **Terraform Init:** Inicialización automática de proveedores y módulos.
4. **Terraform Format Check (`terraform fmt -check`):** Verificación del estilo y formato estándar del código.
5. **Terraform Validate (`terraform validate`):** Análisis estático para garantizar la validez sintáctica de la infraestructura.
