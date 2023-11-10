
# Pillars

1. **Logs**
2. Metrics
3. Traces - A history of requests though multiple apps/services to detect performance bottlenecks
4. Alarms

![[Screenshot 2023-10-25 at 16.35.06.png]]

## Main tools

### CloudWatch Logs

### CloudWatch Metics

### CloudWatch EventBridge

Basically Cron or Task Scheduler for AWS
Triggers based on condition.

### CloudWatch Alarms

Triggers based on Metrics

### CloudWatch Dashboards

Does what it says on the tin

### Service Lense

More Dashboards?

### Container insights

### Synthetics

Test web apps for problems

### Contributor Insights

Test and monitor performance of system to find bottle necks

## Steps to setup monitoring

1. Setup CloudWatch Logs

    CW Logs needs a Log Group
    CW Logs than need a Steam

2. Setup EC2 to send logs.

    Setup IAM permissions.

    ```json
    {
    "Version": "2012-10-17",
    "Statement": [{
    "Effect":"Allow",
    "Acction":[
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogsSteams",
    ],
    "Resource":[
        "arn:aws:logs:....."
    ]
    }]} 
    ```

    Install CloudWatch Logs agent on EC2 instance [Docs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/install-CloudWatch-Agent-on-EC2-Instance.html)

3. Set up rules and alarms

### Create the IAM role for SSM/CloudWatch

1. Create an IAM role with an EC2 trust policy

New Role
Trusted 


2. Add the following managed policies
    `CloudWatchAgentServerPolicy`
    `AmazonSSMManagedInstanceCore`
3. Name the IAM role as below and create
    `CloudWatchAgentServerRole`
4. Launch an EC2 instance and attach the role

### Install the CloudWatch agent using SSM Run Command

1. Choose AWS-ConfigureAWSPackage
2. Under name enter AmazonCloudWatchAgent
3. Install collectd
    `sudo amazon-linux-extras install collectd`
    `sudo dnf install collectd`
    `systemctl start collectd.service`
4. Run the wizard on the EC2 instance command line
    `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard`
5. During the wizard specify additional log file collection
    `/var/log/messages`
6. Run the following command
    `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s`
7. Then make sure the agent is started
    `sudo systemctl start amazon-cloudwatch-agent`



597070230033, 
597070230033
597070230033
597070230033