# !/bin/bash
# Method - 1
# exec 4<&1
# exec 1> out

# while read line 
# do 
#     echo $read;
# done < inputs

# for $read in $(cat inputs) 
# do 
#     echo $read
# done 

# Method - 2
# for $i in `cat inputs` 
# do  
#     echo $i;
# done 

# num=0;
# cat inputs |   
# while read input 
# do 
#     num=$((num+1))
#     echo "Line Number : $num, $input"
# done 

num=0
for read in $(cat inputs) 
do 
    ((num=num+1))
    echo -e $num"\t"$read 
done




