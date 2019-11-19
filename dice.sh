#!/bin/bash -x

echo "welcome"

firstPlayer=1
secondPlayer=2
playerPosition=0
dieRandomNumber=0
checkPosition=0 
dieCounter=0
playerPosition1=0
playerPosition2=0
count=0
ladderPosition=0

NO_PLAY=1
LADDER=2
SNAKE=3

declare -a diedictionary 

function winingPosition() {
    
while [ $playerPosition -lt 100 ]
do
     switchPosition
 
     if [ $playerPosition1 -eq 100 ]
     then
        echo "player one win"
     elif [  $playerPosition2 -eq 100 ]
     then
        echo "player two win"   
     fi   
        
        count=$(( $count + 1 )) 
done
}

function switchPosition() {
if [ $(( $count % 2 )) -eq 0  ]
then

     playerPosition=$playerPosition1
     dice
     playerLadderPosition $playerPosition
     while [ $ladderPosition == 1 ]
     do
     ladderPosition=0
     dice
     playerLadderPosition $playerPosition
     done
     playerPosition1=$playerPosition
     
else

     playerPosition=$playerPosition2
     dice
     playerLadderPosition $playerPosition
     while [ $ladderPosition == 1 ]
     do
     ladderPosition=0
     dice
     playerLadderPosition $playerPosition
     done
     playerPosition2=$playerPosition
     
fi

}

function dice() {

dieRandomNumber=$(( ( RANDOM % 6 ) + 1 ))
checkPosition=$(( ( RANDOM % 3 ) + 1 ))

case $checkPosition in
   $NO_PLAY)
         playerPosition=$playerPosition    
         ;;
   $LADDER)
         playerPosition=$(( $playerPosition + $dieRandomNumber ))
         ladderPosition=1
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

function playerLadderPosition() {
     
     if [ $1 -gt 100 ]
     then
             playerPosition=$(( $playerPosition - $dieRandomNumber ))
     else
             diedictionary[$dieCounter]=$playerPosition
             dieCounter=$(( $dieCounter + 1 ))
         
     fi
}

winingPosition