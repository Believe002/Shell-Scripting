# !/bin/bash


# Defining Variables 
DbName='test';
User='vishwaas';
Password='Simform@123';
OutFile="Postgres_Backup_$(date +%Y-%m-%d).sql";

DirFormat="PostgreSQL_$(date +%Y-%m-%d)";
echo -e "\nThe Formate for folder is : $DirFormat\n";
echo -e "The Format for File is : $OutFile\n";
#Setting PGPASSWORD Environment Variable
PGPASSWORD='Simform@123';
# Perfoming Backup
pg_dump -U "$User" -d "$DbName" -f "/var/tmp/$OutFile" 2>/dev/null;

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
    while [ $n -gt 0 ];
    do
        echo -e "..\c";
        ((n=n-1));
        sleep 1s;
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






