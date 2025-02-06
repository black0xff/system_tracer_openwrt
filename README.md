# before starting 
for more logging level i suggest to add this lines :

kernel.print-fatal-signals = 1
net.ipv4.conf.all.log_martians = 1
kernel.printk = 7 7 7 7
net.core.warnings = 1

to file /etc/sysctl.conf 
then type : sysctl -p 

for applying the changes
