# !/bin/bash

Domain="www.vishwaas.com";
echo "Domain : $Domain";

$(grep -w $Domain /etc/hosts);

if [ $? -gt 0 ];
then 
    echo -e "\nAdding $Domain to /etc/hosts";
    echo "127.0.0.2     $Domain" >> /etc/hosts;
    grep -w "$Domain" /etc/hosts;

else 
    echo -e "\n$Domain alreay Exists !!";
fi



