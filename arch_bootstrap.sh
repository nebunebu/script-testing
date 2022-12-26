#!/bin/sh

###########################################################################
# ..................%%%%...%%%%%....%%%%...%%..%%.........................#
# ................ %%..%%..%%..%%..%%..%%..%%..%%.........................#
# .................%%%%%%..%%%%%...%%......%%%%%%.........................#
# .................%%..%%..%%..%%..%%..%%..%%..%%.........................#
# .................%%..%%..%%..%%...%%%%...%%..%%.........................#
# ........................................................................#
# .%%%%%....%%%%....%%%%...%%%%%%...%%%%...%%%%%%..%%%%%....%%%%...%%%%%..#
# .%%..%%..%%..%%..%%..%%....%%....%%........%%....%%..%%..%%..%%..%%..%%.#
# .%%%%%...%%..%%..%%..%%....%%.....%%%%.....%%....%%%%%...%%%%%%..%%%%%..#
# .%%..%%..%%..%%..%%..%%....%%........%%....%%....%%..%%..%%..%%..%%.....#
# .%%%%%....%%%%....%%%%.....%%.....%%%%.....%%....%%..%%..%%..%%..%%.....#
# ........................................................................#
# #########################################################################

###################################
# Set the console keyboard layout #
# #################################

# Sets keymap to US qwerty with ESC and CAPS_LOCK swapped

cp /usr/share/kbd/keymaps/i386/qwerty/us.map.gz \
  /usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map.gz 
gzip -d '/usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map.gz'
sed -i -e 's/1 = Escape/58 = Escape/' -e 's/58 = Caps_Lock/1 = Caps_Lock/' \
  '/usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map'
gzip '/usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map'
loadkeys us_swap_esc_caps

########################
# Set the console font #
########################

setfont gr928-8x16-thin.psfu
echo 'FONT=gr928-8x16-thin.psfu' > /etc/vconsole.conf

########################
# Verify the boot mode #
# ######################
[ -d /sys/firmware/efi/efivars ] && bootmode=efi || bootmode=bios

##########################
# Check the systemclock #
##########################
 
# Checks system clock against time in header of get request from google
# exit on out of sync
[ "$(curl -v google.com 2>&1 | awk 'NR==16 {print $7}')" \
  = "$(timedatectl status | awk 'NR==2 {print $5}')" ] \
  || echo "System clock is out of sync"

#######################
# Partition the disks #
#######################


