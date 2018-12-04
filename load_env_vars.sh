#!/bin/bash

STACK_INFO=`aws cloudformation describe-stacks --stack-name rds-mssql-ha-stack`
# echo "DEBUG - STACK_INFO: ${STACK_INFO}"

export RDS_MSSQL_HA_DB_USERNAME=`echo ${STACK_INFO} | jq -r '.Stacks[0].Parameters | .[] | select(.ParameterKey == "MasterUsername") | .ParameterValue'`
# echo "DEBUG - RDS_MSSQL_HA_DB_USERNAME: ${RDS_MSSQL_HA_DB_USERNAME}"

export RDS_MSSQL_HA_DB_PASSWORD=`echo ${STACK_INFO} | jq -r '.Stacks[0].Parameters | .[] | select(.ParameterKey == "MasterPassword") | .ParameterValue'`
# echo "DEBUG - RDS_MSSQL_HA_DB_PASSWORD: ${RDS_MSSQL_HA_DB_PASSWORD}"

export RDS_MSSQL_HA_DB_URL_1=`echo ${STACK_INFO} | jq -r '.Stacks[0].Outputs | .[] | select(.OutputKey=="DB1Url") | .OutputValue'`
# echo "DEBUG - RDS_MSSQL_HA_DB_URL_1: ${RDS_MSSQL_HA_DB_URL_1}"

export RDS_MSSQL_HA_DB_URL_2=`echo ${STACK_INFO} | jq -r '.Stacks[0].Outputs | .[] | select(.OutputKey=="DB2Url") | .OutputValue'`
# echo "DEBUG - RDS_MSSQL_HA_DB_URL_2: ${RDS_MSSQL_HA_DB_URL_2}"

