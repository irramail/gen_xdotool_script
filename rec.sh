#!/bin/bash

while :;
do
echo -e "[ 1 ] mouse move to location\n[ 2 ] click left button\n[ 3 ] type text\n[ 4 ] Enter\n[ 5 ] Duble click\n[ 6 ] Ctrl+a\n[ 7 ] Del\n[ 8 ] Pause 10 sec\n[ 9 ] Ctrl+t\n[ 0 ] Ctrl+w"
sleep 1
echo 'sleep 1' >> script.sh
read choice
case $choice in
1)
  coord=`DISPLAY=:0.0 xdotool getmouselocation | awk '{print $1" "$2}' | sed s/.://g`
  echo "DISPLAY=:0.0 xdotool mousemove $coord"  >> script.sh
  ;;
2)
  echo "DISPLAY=:0.0 xdotool click 1" >> script.sh
  DISPLAY=:0.0 xdotool click 1
  ;;
3)
  echo 'Enter text for type:'
  read text
  echo "DISPLAY=:0.0 xdotool type $text" >> script.sh
  DISPLAY=:0.0 xdotool type $text
  ;;
4)
  echo "DISPLAY=:0.0 xdotool key Return" >> script.sh
  DISPLAY=:0.0 xdotool key Return
  ;;
5)
  echo "DISPLAY=:0.0 xdotool click --repeat 2 1" >> script.sh
  DISPLAY=:0.0 xdotool click --repeat 2 1
  ;;
6)
  echo "DISPLAY=:0.0 xdotool key Control_L+a" >> script.sh
  DISPLAY=:0.0 xdotool key Control_L+a
  ;;
7)
  echo "DISPLAY=:0.0 xdotool key Delete" >> script.sh
  DISPLAY=:0.0 xdotool key Delete
  ;;
8)
  echo "sleep 10" >> script.sh
  ;;
9)
  echo "DISPLAY=:0.0 xdotool key Control_L+t" >> script.sh
  DISPLAY=:0.0 xdotool key Control_L+t
  ;;
0)
  echo "DISPLAY=:0.0 xdotool key Control_L+w" >> script.sh
  DISPLAY=:0.0 xdotool key Control_L+w
  ;;
*)
  echo 'Sorry, unknown command.'
  ;;
esac
done
