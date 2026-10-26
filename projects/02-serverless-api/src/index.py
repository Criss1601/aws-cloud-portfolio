import json
import os
import boto3
from botocore.exceptions import ClientError

dynamodb = boto3.resource('dynamodb')
table_name = os.environ.get('TABLE_NAME')
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    print("Received event: " + json.dumps(event))
    http_method = event.get('httpMethod', 'GET')
    
    try:
        if http_method == 'POST':
            body = json.loads(event.get('body', '{}'))
            item_id = body.get('id')
            item_name = body.get('name', 'Sin nombre')
            
            if not item_id:
                return {
                    'statusCode': 400,
                    'body': json.dumps({'error': 'El campo id es obligatorio'})
                }
                
            table.put_item(Item={'id': item_id, 'name': item_name})
            return {
                'statusCode': 201,
                'body': json.dumps({'message': 'Item creado con éxito', 'id': item_id})
            }
            
        elif http_method == 'GET':
            query_params = event.get('queryStringParameters') or {}
            item_id = query_params.get('id')
            
            if item_id:
                response = table.get_item(Key={'id': item_id})
                if 'Item' not in response:
                    return {
                        'statusCode': 404,
                        'body': json.dumps({'error': 'Item no encontrado'})
                    }
                return {
                    'statusCode': 200,
                    'body': json.dumps(response['Item'])
                }
            else:
                response = table.scan()
                return {
                    'statusCode': 200,
                    'body': json.dumps(response.get('Items', []))
                }
                
        return {
            'statusCode': 405,
            'body': json.dumps({'error': 'Método no permitido'})
        }
        
    except ClientError as e:
        print(e.response['Error']['Message'])
        return {
            'statusCode': 500,
            'body': json.dumps({'error': 'Error interno del servidor'})
        }
