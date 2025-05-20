const AWS = require('aws-sdk');
const db = new AWS.DynamoDB.DocumentClient();
const { v4: uuidv4 } = require('uuid');

exports.handler = async (event) => {
  const timestamp = new Date().toISOString();
  const requestId = uuidv4();
  const userAgent = event.headers?.['User-Agent'] || 'Unknown';

  const params = {
    TableName: 'lambda_logs',
    Item: {
      request_id: requestId,
      timestamp,
      userAgent,
    },
  };

  try {
    await db.put(params).promise();

    return {
      statusCode: 200,
      body: JSON.stringify({ message: "Hello from Lambda with DynamoDB logging!" }),
    };
  } catch (err) {
    console.error("DynamoDB error:", err); // This will show up in CloudWatch

    return {
      statusCode: 500,
      body: JSON.stringify({ message: "Internal server error", error: err.message }),
    };
  }
};
