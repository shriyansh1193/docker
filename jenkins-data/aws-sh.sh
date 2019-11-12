#/bin/bash

DATE=$(date +%H-%M_%S)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIAQJQDMQDX26H3TWDR && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading db $BACKUP" && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP