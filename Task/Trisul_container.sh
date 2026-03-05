

#!/bin/bash

echo "----opening fire fox----"
sleep 4
firefox https://static.trisul.org/
echo "+++++++++ Trisul +++++++"
echo ""
sleep 5
echo ""
echo "-------- Dark --------"
sleep 5
echo ""
sleep 5
echo "+++++++ coniguring container +++++++++"
echo ""
sleep 3
echo "+++++image listing+++++"
sleep 3
echo ""
echo ""
echo "+++++choouse the image  oracl , ubuntu+++++"
read -p "chouse the image " a
read -p "chouse the name " b
echo ""
echo ""
echo "++++++ launch the image ubuntu/jammy +++++++++"
incus launch images:$a $b

echo ""
echo ""
sleep 3
echo "+++++++++++ exec the cont +++++++++  "

echo ""
echo ""
sleep 2

echo ""
echo "+++++incus lanch and exe successful+++++"
echo ""
sleep 2
echo "+++++ trisul install +++++"
cat << 'EOF' > kk.sh
#!/bin/bash
  
  echo "+++++installing through web page+++++"
  
  read -p "enter the link " sk
  apt install wget
  wget $sk
  
  echo "+++++untaring the file+++++"
  tar -xf *.tar.gz
  
  echo "moving into the file"
  cd *-ubuntu_jammy
  
  echo "+++++install the packages+++++"
   dpkg -i *hub*jammy_amd64.deb 
   dpkg -i *prob*jammy_amd64.deb
   dpkg -i web*jammy_amd64.deb
   dpkg -i *geo*jammy_amd64.deb
   dpkg -i *bad*jammy_amd64.deb
   sudo service trisul-probe restart

EOF

echo "+++++ pushing installer to container +++++"
incus file push kk.sh $b/root/kk.sh
incus exec $b -- bash /root/kk.sh
echo ""
sleep 2
echo ".....Waiting IP......"
sleep 5


ip=$(incus list "$b" --format csv -c 4 | awk '{print $1}')

if [ -z "$ip" ] 
then
    echo "no ip"
else
    echo "Opening Trisul at http://$ip:3000"
    firefox "http://$ip:3000" &
fi


