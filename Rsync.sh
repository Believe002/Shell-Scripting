# !/bin/bash

read -p "Please Enter File/Folder to be Shared : " Souce;
read -p "Please Enter Destination HostName@IP_Addr :" Hostname;
read -p "Please Enter Destination Path : " Destination;

echo -e "\n\n"

echo -e "\nSelect 1 for SCP\nSelect 2 for Rsync\n"
read choice

Host="$Hostname:$Destination";
echo $Host;

exit=0;

case $choice in 
1|"Rsync"|"rsync")
    rsync -avz "$Souce" "$Host";
    ;;
2|"SCP"|"scp")
    scp "$Source" "$Host";
    ;;
*)
    echo "Wrong Choice !!";
    exit=1
    ;;
esac

if [ $? -eq 0 ] && [ exit -eq 0 ] 
then
echo -e "\n\n\n Sucess....\n\n\n"
elif [ exit=true ] || [ exit -eq 1]
then
echo -e "\n\n Failure \n\n"
fi
