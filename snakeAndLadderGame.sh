#!/bin/bash

echo "================ Welcome to SNAKES AND LADDERS ================"

#CONSTANTS
GOAL_OF_THE_GAME=100;
PLAYER_GETS_NO_PLAY=0;
PLAYER_GETS_LADDER=1;
PLAYER_GETS_SNAKE=2;

playerLivePosition=0;

function playerThrowsDice() {
	echo $((RANDOM%6+1))
}

function playerPostionTrack() {
	playerOptions=$((RANDOM%3))
	randomDiceNumber=$((playerThrowDice))
	case $playerOptions in
		$PLAYER_GETS_NO_PLAY)
			playerLivePosition=$((playerLivePosition))
			;;
		$PLAYER_GETS_LADDER)
			playerLivePosition=$((playerLivePosition+randomDiceNumber))
			;;
		$PLAYER_GETS_SNAKE)			
			if [[ $playerLivePosition -lt $randomDiceNumber ]]
			then
				playerLivePosition=$((playerLivePosition))
			else
				playerLivePosition=$((playerLivePosition-randomDiceNumber))
			fi
			;;
	esac
}

function playerReachTowardsGoal() {
	while [[ playerLivePosition -le GOAL_OF_THE_GAME ]]
	do
		playerPositionTrack
	done
}

playerReachTowardsGoal
#End of Use Case 04
