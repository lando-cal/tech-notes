"A Mighty CLI for AWS" - <https://github.com/wallix/awless>

# Examples

## List ec2 instances sorted by uptime

```
user@localhost:~/ $ awless list instances --sort=uptime
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
