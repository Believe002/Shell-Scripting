# !/bin/bash

Total=0
All=$@
echo $All

Star=$*
echo "$Star"

for one in $All 
do 
    echo "$one"
done

while true 
do 
    if [ $1 == 0 ] 
    then
        echo "exiting"
        break
    fi

    Total=`expr $Total + 1`
    echo "$1    Total : $Total "
    shift

done 
