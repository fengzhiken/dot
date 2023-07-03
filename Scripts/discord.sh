#!/bin/bash

checkFile="discordinstcheck-$(date +%s).txt"
tmpFile="discordinsttmp-$(date +%s).txt"
downloadUrl="https://discord.com/api/download?platform=linux&format=tar.gz"

function betterDiscordInst() {
  betterdiscordctl install &> $tmpFile
  tst=`cat $tmpFile | awk '{ print $2" "$3 }'`
  if [ "$tst" = "Already installed." ]; then
    betterdiscordctl reinstall &> $tmpFile
    tstNext=`cat $tmpFile | tail -1`
    if [ "$tstNext" = "Reinstalled." ]; then
      echo "BetterDiscord has been installed"
    fi
  fi
}

function clean() {
  rm -rf /usr/share/applications/discord.desktop
  rm -rf /usr/bin/Discord
  rm -rf /opt/Discord
}

function discordInst() {
  echo "Downloading discord.tar.gz"
  curl -L $downloadUrl -o discord.tar.gz
  echo "Extracting discord.tar.gz"
  tar -xf discord.tar.gz
  echo "Installing Discord"
  clean
  mv Discord /opt/Discord
  chown root:root -R /opt/Discord
  echo "Setting up desktop files and symlinks"
  ln -sf /opt/Discord/Discord /usr/bin/Discord
  sed -i 's/Exec=.*/Exec=\/usr\/bin\/Discord/' /opt/Discord/discord.desktop
  sed -i 's/Icon=.*/Icon=\/opt\/Discord\/discord.png/' /opt/Discord/discord.desktop
  cp /opt/Discord/discord.desktop /usr/share/applications/discord.desktop
  echo "Discord has been installed to latest version"
}

read -p "Do you also want to install BetterDiscord? (yes/no) " userInput
echo "Checking latest version"
if [ -a "/opt/Discord/resources/build_info.json" ]; then
  curl -s $downloadUrl > $checkFile
  remoteVersion=`cat $checkFile | sed '/.*.tar.gz/!d' | sed 's/.*discord-\(.*\).tar.gz.*/\1/'`
  localVersion=`cat /opt/Discord/resources/build_info.json | sed -E '/version/!d' | sed -E 's/.*"version": "(.*)"/\1/'`

  if [ $remoteVersion = $localVersion ]; then
    echo "Already a latest version"
  else
    discordInst
  fi
else
  discordInst
fi

if [ $userInput = "yes" ] && [ ! -x $(command -v betterdiscordctl) ]; then
  echo "Installing BetterDiscord"
  curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
  chmod +x betterdiscordctl
  mv betterdiscordctl /usr/local/bin
  betterDiscordInst
elif [ $userInput = "yes" ] && [ -x $(command -v betterdiscordctl) ]; then
  echo "Upgrading BetterDiscord"
  betterdiscordctl self-upgrade
  betterDiscordInst
fi
rm -rf $tmpFile 
rm -rf $checkFile 
