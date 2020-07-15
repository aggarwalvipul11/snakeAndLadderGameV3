#!/bin/bash 

echo "================ Welcome to SNAKES AND LADDERS ================"

#Apply values to variables
SINGLE_PLAYER=1;
GOAL_OF_THE_GAME=100;

playerLivePosition=0;

PLAYER_GETS_NO_PLAY=0;
PLAYER_GETS_LADDER=1;
PLAYER_GETS_SNAKE=2;

function playerThrowsDice() {
	echo $(($((RANDOM %6))+1))
}


function playerPositionTrack() {
	playerOptions=$((RANDOM %3))
	randomDiceNumber=$(playerThrowsDice )
	case $playerOptions in
		$PLAYER_GETS_NO_PLAY)
			playerLivePosition=$((playerLivePosition))
			;;
		$PLAYER_GETS_LADDER)
			checksPlayerPositionInCaseOfLadder
			;;
		$PLAYER_GETS_SNAKE)			
			checksPlayerPositionInCaseOfSnake
			;;
	esac
}

function checksPlayerPositionInCaseOfLadder() {
	if [[ $(( $playerLivePosition + $randomDiceNumber )) -gt $GOAL_OF_THE_GAME ]]
	then
		playerLivePosition=$((playerLivePosition));
	else
		playerLivePosition=$((playerLivePosition+randomDiceNumber));
	fi
}

function checksPlayerPositionInCaseOfSnake() {
	if [[ $playerLivePosition -lt $randomDiceNumber ]]
	then
		playerLivePosition=$((playerLivePosition));
	else
		playerLivePosition=$((playerLivePosition-randomDiceNumber));
	fi
}

function gameSnakeNLadderControlPanel() {
	while [[ $playerLivePosition -ne $GOAL_OF_THE_GAME ]]
	do
		playerPositionTrack
	done
}

gameSnakeNLadderControlPanel
#End of Use Case 05
