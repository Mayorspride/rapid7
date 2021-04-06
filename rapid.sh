wget -P /tmp https://download2.rapid7.com/download/InsightVM/Rapid7Setup-Linux64.bin

cd /tmp

chmod +x Rapid7Setup-Linux64.bin

sudo ./Rapid7Setup-Linux64.bin


Select the following option(s) and enter the following value(s) when prompted.


Do you want to continue?
Yes [y, Enter], No [n]
Y
  
Select only the set of components you want to install:
Security Console with local Scan Engine [1, Enter]
Scan Engine only [2]
2
                 
Communication Direction:
Engine to Console [1, Enter]
Console to Engine [2]
2
 
Where should Rapid7 Vulnerability Management be installed?
[/opt/rapid7/nexpose]
ENTER (accept default choice)
 
Minimum requirements met. Select "Yes" to continue, "No" to cancel installation.
Yes [y, Enter], No [n]
Y
                                 
Next [n, Enter], Exit [e]
ENTER (accept default choice)
 
First name:
[]
$HOSTNAME
Last name:
[]
Cybersecurity
Company:
[]
Cerner
 
Do you want to pair the scan engine with the console now? Pairing on installation is recommended, but you can pair later if necessary.
Yes [y], No [n]
N


sudo systemctl stop firewalld

sudo systemctl disable firewalld



Copy this file -->   nexpose-azure-poc/tf/files/installer/CustomEnvironment.properties    /opt/rapid7/nexpose/nse/  ---#This is a gitlab page.

Copy this file -->   nexpose-azure-poc/tf/files/shareddeploy/WRK73572-vm/consoles.xml     /opt/rapid7/nexpose/nse/keystores/nse.ks  

Copy this file -->   nexpose-azure-poc/tf/files/shareddeploy/WRK73572-vm/nse.ks     /opt/rapid7/nexpose/nse/conf/nse.xml

Copy this file -->  nexpose-azure-poc/tf/files/shareddeploy/WRK73572-vm/nse.xml    /opt/rapid7/nexpose/nse/conf/consoles.xml



cd /opt/rapid7/nexpose/nse
./nexposeengine start

OR 


sudo systemctl restart nexposeengine.service


=============================== Current Script ========

#!/usr/bin/expect -f

expect "Yes [y, Enter], No [n]"
send "Y"
  
expect "Scan Engine only [2]"
send "2"
                 
# Communication Direction:
# Engine to Console [1, Enter]
expect "Console to Engine [2]"
send "2"
 
# Where should Rapid7 Vulnerability Management be installed?
expect "[/opt/rapid7/nexpose]"
send "ENTER"
 
# Minimum requirements met. Select "Yes" to continue, "No" to cancel installation.
expect "Yes [y, Enter], No [n]"
send "Y"
                                 
expect "Next [n, Enter], Exit [e]"
send "ENTER"
 
#First name:
expect "[]"
send "CTM"
#Last name:
expect "[]"
send "Cybersecurity"
#Company:
expect "[]"
send "Cerner"
 
