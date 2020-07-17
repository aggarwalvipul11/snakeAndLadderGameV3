#!/bin/bash

echo "================ Welcome to SNAKES AND LADDERS ================"

#CONSTANTS
PLAYER_GETS_NO_PLAY=0;
PLAYER_GETS_LADDER=1;
PLAYER_GETS_SNAKE=2;

#Apply values to variables
playerLivePosition=0;

function playerThrowsDice() {
	echo $((RANDOM%6+1))
}

function playerPostionTrack() {
	playerOptions=$((RANDOM%3))
	randomDiceNumber=$(playerThrowDice)
	case $playerOptions in
		$PLAYER_GETS_NO_PLAY)
			playerLivePosition=$((playerLivePosition))
			;;
		$PLAYER_GETS_LADDER)
			playerLivePosition=$(($playerLivePosition+$randomDiceNumber))
			;;
		$PLAYER_GETS_SNAKE)
			playerLivePosition=$(($playerLivePosition-$randomDiceNumber))
			;;
		*)
			echo "Game Error, Please try again"
			;;
	esac
}

playerPositionTrack
#End of Use Case 03
