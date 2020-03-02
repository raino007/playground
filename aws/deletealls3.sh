#This script will delete all s3 buckets  in your aws account.
#!/bin/bash


read -p 'Please provide your aws profile name:' profile
read -p 'Please provide your aws region:' region
read -p 'Do you want to delete all buckets:(y/n):' value
if [ "$value" = "y" ] || [ "$value" = "Y" ]
then
 s3_name=$(aws s3 ls --profile $profile --region $region| awk '{print $3}')
 for i in $s3_name
 do 
	 sleep 1s
	 echo "$i"
	 aws s3 rb s3://$i --force --profile $profile --region $region
         done 
elif [ "$value" = "n" ] || [ "$value" = "N" ]
then
read -p 'Please provide the bucketname/word to be searched' name
s3_name=$(aws s3 ls --profile $profile --region $region| grep "$name" | awk '{print $3}')
for i in $s3_name
do
         sleep 1s
         echo "$i"
         aws s3 rb s3://$i --force --profile $profile --region $region
         done
else
	echo "Invalid option"

fi



