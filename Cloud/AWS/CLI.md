
### CloudFormation

``` yml

```

``` bash
aws cloudformation create-stack \
--stack-name <stack_name> \
--template-bode file://path/to/file.yml \ # or s3://bucket/file.yml
--capabilities <IAM_role>

also 
update-stack --stack-name <stack_name>
delete-stack --stack-name <stack_name>

```