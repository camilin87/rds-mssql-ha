# rds-mssql-ha  
Verify the availability of MultiAZ MSSSQL RDS databases.
Make sure that scaling operations in MultiAZ databases take no downtime.  

## IAM Setup  

Create AWS Credentials with the following permissions  
- `AmazonRDSFullAccess`
- Add an inline `CloudFormationFullAccess` policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1488265872000",
      "Effect": "Allow",
      "Action": [
        "cloudformation:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
```

