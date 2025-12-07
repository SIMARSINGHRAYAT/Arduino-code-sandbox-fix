cd ~/Downloads/arduino-ide_2.3.6_Linux_64bit
ls -la
if [ -f ./chrome-sandbox ]; then
  sudo chown root:root ./chrome-sandbox
  sudo chmod 4755 ./chrome-sandbox
  echo "chrome-sandbox fixed"
else
  echo "chrome-sandbox not found in this folder"
fi
if [ -f ./arduino-ide ]; then
  chmod +x ./arduino-ide
else
  echo "arduino-ide launcher not found"
fi
./arduino-ide || ./arduino-ide --no-sandbox || echo "Failed to start arduino-ide here."
cd ..
sudo mv ./arduino-ide_2.3.6_Linux_64bit /opt/arduino-ide_2.3.6 || echo "skip move (already moved?)"
sudo ln -sf /opt/arduino-ide_2.3.6/arduino-ide /usr/local/bin/arduino-ide
sudo tee /usr/share/applications/arduino-ide.desktop > /dev/null << 'EOF'
[Desktop Entry]
Name=Arduino IDE 2.3.6
Comment=Arduino IDE
Exec=/opt/arduino-ide_2.3.6/arduino-ide
Icon=/opt/arduino-ide_2.3.6/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;Electronics;
EOF
sudo usermod -aG dialout $USER
echo "You were added to the dialout group. Log out and log back in or reboot for this to take effect."
