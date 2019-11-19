#!/bin/bash -x

echo "welcome"


player=1
playerPosition=0

declare NO_PLAY=1
declare LDDER=2
declare SNAKE=3


function dice() {
dieRandomNumber=$(( ( RANDOM % 6 ) + 1 ))
checkPosition=$(( ( RANDOM % 3 ) + 1 ))
case $checkPosition in
   $NO_PLAY)
         playerPosition=$playerPosition    
         ;;
   $LDDER)
         playerPosition=$(( $playerPosition + $dieRandomNumber ))
         ;;
    $SNAKE)
         playerPosition=$(( $playerPosition - $dieRandomNumber ))
         ;;
esac

}
dice