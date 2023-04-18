# !/bin/bash

# PS3="Enter Some Choice"
# select i in First Second Third
# do
# echo $i;
# echo $REPLY

# done 

clear;

read -p "Enter the File Path : " Path

if [ -z $Path ]
then 
    Path="$PWD";
    echo "Path: $Path"
fi
echo -e  "\n-----Enter Number of Specific Enteries You want to list ----\n
-----Enter 'a' or '0' to see all Entries-----"
read -p "Enter Choice : " choice

if [ $choice -gt 0 ]  
then 
    du -ah "$Path" | #Find Disk Usage in Human Readable Format for the path
    sort -rh | #Sort in Reverse and Numeric
    head -n 5 #List Specific Number of Entries
else 
    echo -e "-------Displaying All the Records--------- \n\n"
    du -ah "$Path" | #Find Disk Usage in Human Readable Format for the path
    sort -rn  #Sort in Reverse and Numeric
fi 



