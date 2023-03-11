#! /bin/bash

if [[ -z "${INITIAL_USERNAME}" ]]; then
  INITIAL_USERNAME="user"
fi
if [[ -z "${INITIAL_PASSWORD}" ]]; then
  INITIAL_PASSWORD="userland"
fi
if [[ -z "${INITIAL_VNC_PASSWORD}" ]]; then
  INITIAL_VNC_PASSWORD="userland"
fi

if [ ! -d "/home/$INITIAL_USERNAME" ]; then
  sed -i 's/force_color_prompt=/#force_color_prompt=/g' /etc/skel/.bashrc
  useradd $INITIAL_USERNAME -s /bin/bash -m -u 2000 
  echo $INITIAL_USERNAME:$INITIAL_PASSWORD | chpasswd
  chsh -s /bin/bash $INITIAL_USERNAME
  touch /home/$INITIAL_USERNAME/.hushlogin
fi
