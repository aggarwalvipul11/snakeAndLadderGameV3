#!/bin/bash

echo "================ Welcome to SNAKES AND LADDERS ================"

#Constants
SINGLE_POSITION=1;
POSITION_OF_PLAYER=0;

function playerThrowsDice() {
	randomDiceRolls=$((RANDOM%6+1))
	echo $randomDiceRolls
}

playerThrowDice
#End of Use Case 02
