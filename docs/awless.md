"A Mighty CLI for AWS" - <https://github.com/wallix/awless>

# Examples

- Example templates - <https://github.com/wallix/awless-templates>

A lot of these syntax examples can be found by issuing the command, verb and entity but no parameters. Such as `awless create stack`, which will drop you into a prompt series to complete the necessary and optional parameters.

## List ec2 instances sorted by uptime

```
$ awless list instances --sort=uptime
|         ID          |    ZONE    |           NAME          |  STATE  |    TYPE    | PUBLIC IP |   PRIVATE IP  | UPTIME ▲ | KEYPAIR |
|---------------------|------------|-------------------------|---------|------------|-----------|---------------|----------|---------|
| i-050ad501b33c6ad07 | us-west-1a | faruko-nal              | running | m4.xlarge  |           | 172.19.15.172 | 85 mins  | foo-ops |
| i-5b381e9b          | us-west-1b | planted-collector11.foo | running | m4.xlarge  |           | 172.27.26.159 | 6 days   | foo-ops |
| i-04ced9880586c009b | us-west-1a | hadoop07.foo            | running | m4.4xlarge |           | 172.27.37.100 | 8 days   | foo-ops |
| i-0e583dcd3bc2444d8 | us-west-1a | db-na-historical06.foo  | running | m2.4xlarge |           | 172.19.48.79  | 12 days  | foo-ops |
```

## Sum the amount of unattached disks in your environment

```
awless list volumes \
    --filter state=available \
    --format json |
  jq .[].Size |
  awk '{sum += $1 ; count += 1 ;} END {print sum "G in " count " volumes"}'
```

## Switch to a different AWS profile

This uses the ~/.aws/credentials file for its profiles

Short way:

```
awless switch prod
```

Long way:

```
awless config set aws.profile prod
```

## Customize output columns

```
awless list instances --columns name,type,launched
```

## Add a user to a group

```
awless --aws-profile govcloud --aws-region us-gov-west-1 attach user group=SystemAdministrators name=SpaceGhost
```

## Create an access key for a user

This creates an access key and saves it in `~/.aws/credentials`

```
awless --aws-profile govcloud --aws-region us-gov-west-1 create accesskey user=SpaceGhost save=true
```

## Create a tag

```
awless create tag key=test_tag resource=i-9ba90158 value=true
```

## Delete a tag

```
awless delete tag key=test_tag_dhoherd resource=i-9ba90158
```

## Create an instance

```
awless create instance count=1 image=ami-5ab82fa8 keypair=ops name=new-hostname securitygroup=[sg-c4321fd1,sg-c4321cb0] subnet=subnet-c4321c33 type=t2.medium
```
