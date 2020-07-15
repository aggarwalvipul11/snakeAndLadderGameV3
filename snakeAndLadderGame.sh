#!/bin/bash 

echo "================ Welcome to SNAKES AND LADDERS ================"

#CONSTANTS
SINGLE_PLAYER=1;
GOAL_OF_THE_GAME=100;

playerLivePosition=0;
collectDiceRollsWinGame=0;

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
			((collectDiceRollsWinGame++))
			;;
		$PLAYER_GETS_SNAKE)			
			checksPlayerPositionInCaseOfSnake
			;;
	esac
    echo "After dice rolls, player live positon status is: $playerLivePosition"
}

function checksPlayerPositionInCaseOfLadder() {
	if [[ $(( $playerLivePosition + $randomDiceNumber )) -gt $goalOfTheGame ]]
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
	echo "Report the dice was played by player to win is: $collectDiceRollsWinGame"
}

gameSnakeNLadderControlPanel
#End of Use Case 06
