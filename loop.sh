#!/bin/bash
############################################################################################ FOR LOOP #############################################################################################



#For in ranges upto N 
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done


#For in a list
for fruit in apple banana cherry; do
    echo "I like $fruit"
done



#Basic range with steps for loop
for i in {0..10..2}
  do
     echo "Welcome $i times"
done
                                        #OR

for i in $(seq 1 2 20)
do
   echo "Welcome $i times"
done


# Make a php copy of any html files
for value in $(pwd)/*.html
do
cp $value $(pwd)/$( basename -s .html $value ).php
done

# Install multiple packages listed in the PKGS variable.
PKGS="docker-ce nginx docker-cli"
for p in $PKGS
do
   echo "Installing $p package"
   sudo apt-get install "$p"
done

############################################################################################ UNTIL LOOP ###################################################################################################

#Basic until loop
counter=1
until [ $counter -gt 10 ] 
do
echo $counter
((counter++))
done
echo All done

########################################################################################## WHILE LOOP ###################################################################################################
 
a=0
# lt is less than operator
#Iterate the loop until a less than 10
while [ $a -lt 10 ]
do
# Print the values
echo "While LOOP: $a"
# increment the value
a=`expr $a + 1`
done 

########################################################################################## IF  ###################################################################################################

#IF else (-gt is greater than, -lt is lesser than, -le, -ge are lesser than equals and greter than equals)

num1=100
num2=200
if [ $num1 -gt $num2 ]; 
then
    echo "$num1 is greater than $num2"
elif [ $num1 -lt $num2 ]; 
then
    echo "$num1 is less than $num2"
else
    echo "$num1 is equal to $num2"
fi 

########################################################################################## Strings  ###################################################################################################
                                           
#Print Odd lines of a file
awk '!(NR%2)' $(pwd)/datafile

########################################################################################## Select ###################################################################################################

# A simple menu system
names='Kyle Cartman Stan Quit'
PS3='Select number[1/2/3/4]: '
select name in $names
do
if [ $name == 'Quit' ]
then
break
fi
echo Hello $name
done
echo Bye


