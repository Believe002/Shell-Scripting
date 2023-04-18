# !/bin/bash


# Defining Variables 
DbName='test';
User='root';
Password='Simform@123';
OutFile='MySQLBackup.sql';

DirFormat="MySQL_$(date +%Y-%m-%d)";
echo -e "\nThe Formate for folder is $Format\n";

# Perfoming Backup
mysqldump -u "$User" --password="$Password" "$DbName" > /var/tmp/"$OutFile" 2>/dev/null;

# Testing Succesfull Backup Creation
if [ $? -eq 0 ] 
then   
    echo -e "\nBackup Created Succesfully\n";
else 
    echo -e "\nFailed To Create Backup...Exiting...\n";
    exit 1;
fi


# Checking for /var/Backup Folder Exist or Not.
if [ -d /var/Backup ] 
then 
    echo -e "\nCreating Folder in /var/Backup/...\n";
    #Some Delay
    n=10
    while [ $n -gt 0 ]
    do
        echo "..";
        $n = $((n-1))
        sleep 1;
    done

else 
    mkdir /var/Backup;
    
    if [ $? -eq 0 ]
    then    
        echo -e "\nSuccesfully Created /var/Backup Folder...\n";
    else 
        echo -e "\nExiting...";
        exit 1;
    fi

fi

# Creating Backup Folder with Database_YYYY_MM_DD Format
mkdir /var/Backup/$DirFormat;

if [ $? -eq 0 ] 
then   
    echo -e "\nSuccesfully Created Directory : $DirFormat\n";
else 
    echo -e "\nFailed To Create Directory : $DirFormat...Exiting...\n";
    exit 1;
fi


# Moving The Backup File from /var/tmp to /var/Backup

mv /var/tmp/$OutFile /var/Backup/$DirFormat/

if [ $? -eq 0 ] 
then   
    echo -e "\nSuccesfully Moved $OutFile...\n";
    echo "Backup Succesfull";
else 
    echo -e "\nFailed To Move $OutFile...Exiting...\n";
    echo "Backup Failed !!";
    exit 1;
fi






