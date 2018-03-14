# Amazon

# Links

- [Amazon service availability by region](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/)
- [Amazon EC2 Instance Types](https://aws.amazon.com/ec2/instance-types/)
- [EC2Instances.info - Easy Amazon EC2 Instance Comparison](http://www.ec2instances.info/)
- [AWS Console](https://console.aws.amazon.com/console/home)
- [AWS in plain english](https://www.expeditedssl.com/aws-in-plain-english)
- [Github - Troposphere](https://github.com/cloudtools/troposphere)
- [s3toosl](http://s3tools.org) - Command Line S3 Client and Backup
- [awless - awless is a powerful, innovative and small surface command line interface (CLI) to manage Amazon Web Services.](https://github.com/wallix/awless)

# Tips

## Reformat accessKeys.csv into .aws/credentials format

```
awk -F, 'BEGIN { print "[temp_name]" ; } !/Access/ {print "aws_access_key_id = "$1"\naws_secret_access_key = "$2}' ~/Downloads/accessKeys.csv
```

# See Also

- [aws cli](awscli)
- [CloudFormation](aws-cloudformation)

# Terms and Acronyms

  Term   | Definition
:------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  AMI    | Amazon Machine Images
  ASG    | Auto-Scaling Group. Auto Scaling can automatically increase the number of Amazon EC2 instances during demand spikes to maintain performance and decrease capacity during lulls to reduce costs.
  AWS    | Amazon Web Services
   AZ    | Data centers. Amazon Availability Zones.
  EBS    | Elastic Block Storage. Provides persistent block-level storage volumes for EC2.
  EC2    | Elastic Compute Cloud
  ELB    | Elastic Load Balancing
  EMR    | Elastic MapReduce. Allows easily and cheap processing of vast amounts of data
  ETS    | Elastic Transcoder. Provides video transcoding of S3 hosted videos
  FPS    | Flexible Payments Service. Provides an interface for micro payments.
  HSM    | Hardware Security Module
  IAM    | Identity and Access Management enables you to securely control access to AWS services and resources for your users. Using IAM, you can create and manage AWS users and groups, and use permissions to allow and deny their access to AWS resources.
  KMS    | Key Management Service
  MFA    | Amazon Web Services Multi-Factor Authentication is a simple best practice that adds an extra layer of protection on top of your user name and password.
  RDS    | Relational Database Service
   RI    | Reserved Instance. EC2 instances for which there is a 1 or 3 year contract with AWS to achieve lower hourly run costs.
Route 53 | A highly available and scalable cloud Domain Name System (DNS) web service.
   S3    | Simple Storage Service
  SES    | Simple Email Service. Provides bulk and transactional email sending.
   SG    | Security Group. Security Groups in AWS are akin to firewalls.
  SNS    | Simple Notification Service. Provides a hosted multiprotocol "push" messaging for applications.
  SQS    | Simple Queue Service. Provides a hosted message queue for web applications.
  SWF    | Simple Workflow. Workflow service for building scalable, resilient applications.
  VPC    | Virtual Private Cloud
