#!/bin/bash
cat << "EOF"
    
                                                       
                                                       
  .--.--.                                              
 /  /    '.                                            
|  :  /`. /                         __  ,-.            
;  |  |--`                        ,' ,'/ /|,--,  ,--,  
|  :  ;_       ,---.     ,--.--.  '  | |' ||'. \/ .`|  
 \  \    `.   /     \   /       \ |  |   ,''  \/  / ;  
  `----.   \ /    /  | .--.  .-. |'  :  /   \  \.' /   
  __ \  \  |.    ' / |  \__\/: . .|  | '     \  ;  ;   
 /  /`--'  /'   ;   /|  ," .--.; |;  : |    / \  \  \  
'--'.     / '   |  / | /  /  ,.  ||  , ;  ./__;   ;  \ 
  `--'---'  |   :    |;  :   .'   \---'   |   :/\  \ ; 
             \   \  / |  ,     .-./       `---'  `--`  
              `----'   `--`---' Installer...
                                                         

EOF

echo "###################################"
echo "Installing requirements packages..."
echo "###################################"
sudo apt-get install git build-essential libxslt-dev python-dev python-virtualenv python-babel zlib1g-dev libffi-dev libssl-dev

echo "############################"
echo "Installing GhostNet on Kali ..."
echo "############################"

cd /usr/local
sudo git clone https://github.com/asciimoo/searx.git
sudo useradd searx -d /usr/local/searx
sudo chown searx:searx -R /usr/local/searx
cd /usr/local/searx
virtualenv searx-ve
. ./searx-ve/bin/activate
./manage.sh update_packages
sed -i -e "s/ultrasecretkey/`openssl rand -hex 16`/g" searx/settings.yml

echo "##############################"
echo "Running Your Private GhostNet ..."
echo "##############################"

clear

cat << "EOF"

   ___ _      ___      _   _   _      _
 / ___| |__  / _ \ ___| |_| \ | | ___| |_
| |  _| '_ \| | | / __| __|  \| |/ _ \ __|
| |_| | | | | |_| \__ \ |_| |\  |  __/ |_
 \____|_| |_|\___/|___/\__|_| \_|\___|\__| 
   
EOF

echo " Go to http://localhost:8888"

python searx/webapp.py


    
