import boto3
ec2 = boto3.resource('ec2')
ec2.Instance('i-0bfbc3ff5c42a3c39').terminate()