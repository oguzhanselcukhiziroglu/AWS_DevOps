# AWS CLI
# Guile - 02_21_2022

# References
# https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
# https://awscli.amazonaws.com/v2/documentation/api/latest/index.html
# https://aws.amazon.com/blogs/compute/query-for-the-latest-amazon-linux-ami-ids-using-aws-systems-manager-parameter-store/



# Installation

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


# Win:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


# Mac:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
# https://graspingtech.com/install-and-configure-aws-cli/


# Linux:
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip  #install "unzip" if not installed
sudo ./aws/install


# Configuration

aws configure #configürasyon yaptığımız komut

cat .aws/config
cat .aws/credentials

aws configure --profile user1 #herhangi bir user için configürasyon yapmak için

export AWS_PROFILE=user1 #aws profilini user1 ile değiştirir
export AWS_PROFILE=default #aws profilini default ile değiştirir

aws configure list-profiles #configürasyon yapılan profilleri listeler

aws sts get-caller-identity #aws hesabımızdaki userların kimlik bilgilerini yazar

# IAM
aws iam list-users #aws iam userları listeler

aws iam create-user --user-name aws-cli-user #iam user oluşturur

aws iam delete-user --user-name aws-cli-user #iam user siler

#EXTRA BİLGİ

aws help
aws <command> help
aws <command> <subcommand> help

# S3
aws s3 ls #s3 bucketlarımızı listeler

aws s3 mb s3://guile-cli-bucket #yeni bucket oluşturur

aws s3 cp in-class.yaml s3://guile-cli-bucket #dosya kopyalar Syntax şöyle: aws s3 cp <LocalPath> <S3Uri> or <S3Uri> <LocalPath> or <S3Uri> <S3Uri>

aws s3 ls s3://guile-cli-bucket #bir buckettaki objectleri listeler

aws s3 rm s3://guile-cli-bucket/in-class.yaml #bir buckettaki dosyayı siler

aws s3 rb s3://guile-cli-bucket #bir bucketı siler (bucketın tamamiyle boş olması gerekiyor)


# EC2
aws ec2 describe-instances #spesifik bir instance ı tanımlamak için

aws ec2 run-instances \    #aşağıdaki özelliklerde yeni bir instance launch etmek için (ters slaş alt satıra geçmek için)
   --image-id ami-033b95fb8079dc481 \
   --count 1 \
   --instance-type t2.micro \
   --key-name KEY_NAME_HERE # put your key name

aws ec2 describe-instances \ #bir instanceı keyname ile filtreler
   --filters "Name = key-name, Values = KEY_NAME_HERE" # put your key name

aws ec2 describe-instances --query "Reservations[].Instances[].PublicIpAddress[]" #instanceların public adres bilgisini sorgular

aws ec2 describe-instances \
   --filters "Name = key-name, Values = KEY_NAME_HERE" --query "Reservations[].Instances[].PublicIpAddress[]" # put your key name #key name ile filtrelediğimiz instanceın ipsini getirir

aws ec2 describe-instances \
   --filters "Name = instance-type, Values = t2.micro" --query "Reservations[].Instances[].InstanceId[]" #instance tipi t2.micro olan makinaların ipsini getirir

aws ec2 stop-instances --instance-ids INSTANCE_ID_HERE # put your instance id 

aws ec2 terminate-instances --instance-ids INSTANCE_ID_HERE # put your instance id

# Working with the latest Amazon Linux AMI

aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region us-east-1 #latest linux 2 ami bilgilerini getirir

aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text #latest linux 2 ami sadece numberını getirir

aws ec2 run-instances --image-id $(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 
'Parameters[0].[Value]' --output text) --count 1 --instance-type t2.micro --key-name YOUR-KEYNAME #en güncel versiyon instance launch eder

# Update AWS CLI Version 1 on Amazon Linux (comes default) to Version 2

# Remove AWS CLI Version 1
sudo yum remove awscli -y # pip uninstall awscli/pip3 uninstall awscli might also work depending on the image

# Install AWS CLI Version 2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip  #install "unzip" if not installed
sudo ./aws/install

# Update the path accordingly if needed
export PATH=$PATH:/usr/local/bin/aws