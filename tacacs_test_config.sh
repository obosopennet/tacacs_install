 #!/bin/sh
 
 echo "##################################"
 echo " Testing the tac_plus.cfg file after changes.
        If no Output then Ok, if some output fix the issue.
        "
 sleep 10
 
 /usr/local/sbin/tac_plus -P /usr/local/etc/tac_plus.cfg

echo "########## Done #########"
