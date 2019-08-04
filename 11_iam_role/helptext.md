Once you successfully executed terraform apply, ssh on to the new instance using the public ip

    ssh -i <your pem key>  ubuntu@<public ip>

assume root privialges
    sudo -s
update apt-get and install python so to allow us to use python pip. 
    apt-get update
    apt-get install -y python3-pip python3-dev
    pip3 install awscli

verify aws cli is installed
    aws --version

lets create a txt file and push it to s3 to test aws role permissions we created as part of this excercise

create a file
    echo "test s3 bucket" > test.txt
    aws s3 cp test.txt s3://<bucketname>/test.txt

to test how the instance got the permissions to access s3
    curl http://169.254.169.254/latest/meta-data/
you can see list of mete data options to check, select iam
    curl http://169.254.169.254/latest/meta-data/iam/
you can see the available options, select  security-credentials
    curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
you can see what permissions you are having, select s3-<bucketname>-role, this is the bucket name you have provided in the var.tf file.
    curl http://169.254.169.254/latest/meta-data/iam/security-credentials/s3-mybucket-role