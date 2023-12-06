# IAM

Users

Users go into Groups
Groups can not go in groups

Managed Policies
Inline Policies

Make policies

``` json
"Effect": "Allow",
"Action": [
    "s3:Read", 
    "ec2: Start"
],
"Condition": {
    "IP": {},
    "Time": {}
},
"Resource": [
    "bucket" 
]
```

Apply policy to user
Apply policy to group


Policy can be assigned to a role
Role can be assigned to a user. Or can be used to grant a services access to other services.
