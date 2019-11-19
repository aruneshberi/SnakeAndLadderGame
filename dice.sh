#!/bin/bash -x

echo "welcome"

NO_PLAY=1
LADDER=2
SNAKE=3
FINAL_POSITION=100
START_POSITION=0
FIRST_PLAYER=1
SECOND_PLAYER=2

dieRandomNumber=0
incrementDieCounter=0
count=0
ladderPosition=0

playerPosition=$START_POSITION
checkPosition=$START_POSITION
playerPosition1=$START_POSITION
playerPosition2=$START_POSITION


declare -a dieDictionary 

function checkWiningPosition() {
    
while [ $playerPosition -lt $FINAL_POSITION ]
do
     switchPlayer
 
     if [ $playerPosition1 -eq $FINAL_POSITION ]
     then
        echo "player one win"
     elif [  $playerPosition2 -eq $FINAL_POSITION ]
     then
        echo "player two win"   
     fi   
        
        count=$(( $count + 1 )) 
done
}

function switchPlayer() {
if [ $(( $count % 2 )) -eq 0  ]
then

     playerPosition=$playerPosition1
     rollDice
     ladderChance
     playerPosition1=$playerPosition
     
else

     playerPosition=$playerPosition2
     rollDice
     ladderChance
     playerPosition2=$playerPosition   
fi
}

function ladderChance() {
     ensurePosition $playerPosition
     while [ $ladderPosition == 1 ]
     do
        ladderPosition=0
        rollDice
        ensurePosition $playerPosition
     done
     
}
function rollDice() {

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
         
         playerPosition=$( playerPositions $playerPosition $dieRandomNumber )
         ;;
esac
}

function playerPositions() {
         
     if [ $1 -gt $START_POSITION ]
     then
         playerPosition=$(( $playerPosition-$2 ))
     else
         playerPosition=0
     fi

     echo $playerPosition 
}

function ensurePosition() {
     
     if [ $1 -gt $FINAL_POSITION ]
     then
             playerPosition=$(( $playerPosition - $dieRandomNumber ))
     else
             dieDictionary[$incrementDieCounter]=$playerPosition
             incrementDieCounter=$(( $incrementDieCounter + 1 ))   
     fi
}


checkWiningPosition