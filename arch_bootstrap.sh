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
# swaps ESC with Caps_Lock

cp /usr/share/kbd/keymaps/i386/qwerty/us.map.gz \
  /usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map.gz 
gzip -d '/usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map.gz'
# Swap Esc and CapsLock
sed -i -e 's/1 = Escape/58 = Escape/' -e 's/58 = Caps_Lock/1 = Caps_Lock/' \
  '/usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map'
gzip '/usr/share/kbd/keymaps/i386/qwerty/us_swap_esc_caps.map'
loadkeys swap_caps_esc_us
