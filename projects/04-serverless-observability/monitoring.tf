# 1. Crear un Tópico SNS para las alertas de la infraestructura
resource "aws_sns_topic" "ops_alerts" {
  name = "serverless-portfolio-alerts"
}

# 2. Suscripción por correo electrónico
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.ops_alerts.arn
  protocol  = "email"
  endpoint  = "cristobalcastillo1601@gmail.com"
}

# 3. Alarma de CloudWatch para detectar errores en la función Lambda
resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "serverless-lambda-errors-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Esta alarma se activa si la función Lambda registra 1 o más errores en 1 minuto."
  
  alarm_actions       = [aws_sns_topic.ops_alerts.arn]

  dimensions = {
    FunctionName = "serverless_api_handler"
  }
}

# 4. Alarma de CloudWatch para detectar alta latencia en Lambda
resource "aws_cloudwatch_metric_alarm" "lambda_duration" {
  alarm_name          = "serverless-lambda-high-latency"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Average"
  threshold           = "3000"
  alarm_description   = "Alerta si el tiempo de respuesta promedio de la Lambda supera los 3 segundos."

  alarm_actions       = [aws_sns_topic.ops_alerts.arn]

  dimensions = {
    FunctionName = "serverless_api_handler"
  }
}
