#!/bin/bash
clear
echo "Do you want to see the usages which command?"  
read -p "echo/cut/awk/sed/head/tail?:" Answer  

case $Answer in  
    Echo|ECHO|echo|eCHO)  
        echo  -e "Different echo command usages:\n"
	name=suchintan
	echo $name
	echo ${name}  
	echo hello $name
	echo "hello $name"
	echo "${name:(-2):2}"
        ;;  
    cut|CUT|Cut|cUT)  
        echo "Different cut command usages when the input is:"  
	cat datafile
	echo	
	echo "1. cut command cuts second byte of each line in datafile"
	cut -b 2 datafile
	echo
	echo "2. cut command cuts 6 bytes of name from the output of who(displays username)"
        who | cut -b -6
	echo
	echo "3. In datafile from coulmn 2 to end using space as the delimiter"
	cut -d ' ' -f2 datafile
	echo
	echo "4. Cut only a column"
	cut -f1 datafile
	echo
	echo "5. Cut each line by characters[1-6]"
	cut -c 1-6 datafile
	echo

	;;
    awk|AWK|Awk|aWK)
	echo "Different Usages of awk command using the following input"
	cat datafile
	echo
	echo "1. Print all the lines in the datafile"
	awk '{print}' datafile
	echo
	echo "2. Print all the lines that contain pattern Name datafile"
	awk '/Name/ {print}' datafile
	echo
	echo "3. Print only fields 1 and 3"
        awk '{print $1,$3}' datafile
        echo
	echo "4. Print only lines from 1-4"
        awk 'NR==1, NR==4 {print NR,$0}' datafile
        echo
	echo "5. Print the longest line in datafile"
        awk '{ if (length($0) > max) max = length($0) } END { print $0,"(length is",max,")" }' datafile
        echo
	echo "6.To count the lines in a file:"
	awk 'END { print NR }' datafile
	echo
	echo "7.To check for a string in a particular field"
	awk '{if ($3=="HR") print $0}' datafile
	echo
	echo "8.To print the squares of first numbers from 1 to n say 6:"
	awk 'BEGIN { for(i=1;i<=6;i++) print "square of", i, "is",i*i; }'
	echo
	echo "9. Count the number of lines where pattern matched"
	awk '/HR/{++cnt} END {print "Count = ", cnt}' datafile
	;;
      sed|SED|Sed|sED)
	echo "Different Usages of the sed command using the following input"
	echo
	cat textfile
	echo
	echo "1. Replacing Unix with Linux in the example file"
	sed 's/Unix/Linux/' textfile
	echo
	echo "2. Replacing the nth occurence of a pattern"
	sed 's/Unix/Linux/2' textfile
	;;
      Head|HEAD|head|hEAD)
	echo
	echo "Various Usages of head command"
	echo
	cat textfile
	echo
	echo "1. Print only first 10 lines"
	head textfile
	echo
	echo "2. Print only first 2 lines"
        head -n 2 textfile
        echo
	echo "3. Print a range of lines from ls output"
	ls -lah | head -n 4
	echo
	;;
      TAIL|tail|Tail|tAIL)
	echo "Different Usages of Tail Command"
	echo
	cat textfile
	echo "1. Print last 10 lines"
	tail textfile
	echo
	echo "2. Print last 2 lines"
        tail -n 2 textfile
        echo
       ;;
      *)
    	echo "Please enter a valid command"
      ;;	  
esac
