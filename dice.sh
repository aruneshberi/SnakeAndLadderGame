#!/bin/bash -x

echo "welcome"


player=1
playerPosition=0
dieRandomNumber=0
checkPosition=0 

declare NO_PLAY=1
declare LDDER=2
declare SNAKE=3

function winingPosition() {
while [ $playerPosition -le 100 ]
do
	dice
        echo "play"
done

}

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
         
         playerPosition=$( playerPostions $playerPosition $dieRandomNumber )
         ;;
esac

}
function playerPostions() {
         
         if [ $1 -gt 0 ]
	 then
         playerPosition=$(( $playerPosition-$2 ))
         else
         playerPosition=0
	 fi

	 echo $playerPosition
     
}
winingPosition