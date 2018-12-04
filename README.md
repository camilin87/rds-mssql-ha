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

## Database setup  

Run this command to create the stack

```bash
aws cloudformation create-stack --stack-name rds-mssql-ha-stack --template-body file://databases.yml
```

And this command for subsequent changes

```bash
aws cloudformation update-stack --stack-name rds-mssql-ha-stack --template-body file://databases.yml
```

**NOTE**: MSSQL Instance classes [need to be very specific](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.InstanceClasses)  

## Cleanup  

```bash
aws cloudformation delete-stack --stack-name rds-mssql-ha-stack
```
