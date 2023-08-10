#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

R=$(( $RANDOM % 1000 + 1 ))
N_OF_GUESSES=0

MAIN_MENU() {
echo "Enter your username:"
read CURRENT_USER
USERNAME=$($PSQL "SELECT username FROM data WHERE username = '$CURRENT_USER'")
GP=$($PSQL "SELECT games_played FROM data WHERE username = '$CURRENT_USER'")
BG=$($PSQL "SELECT best_game FROM data WHERE username = '$CURRENT_USER'")
# new user or not
if [[ $USERNAME ]]
  then
    echo -e "Welcome back, $USERNAME! You have played $GP games, and your best game took $BG guesses."
     else
  INSERT_USER=$($PSQL "INSERT INTO data (username, games_played, best_game) VALUES ('$CURRENT_USER', 0, 0)")
  echo -e "Welcome, $CURRENT_USER! It looks like this is your first time here."
fi
USER_ID=$($PSQL "SELECT user_id FROM data WHERE username = '$CURRENT_USER'")
echo -e "\nGuess the secret number between 1 and 1000:"
# separate function because its recursive
ASK
}

ASK(){
read ANSWER
# not a number
if [[ ! $ANSWER =~ [0-9]{1,4} ]]
then 
echo -e "\nThat is not an integer, guess again:"
ASK
# lower
elif [[ $ANSWER -lt $R ]]
then
echo -e "\nIt's higher than that, guess again:"
N_OF_GUESSES=$((N_OF_GUESSES+1))
ASK
# bigger
elif [[ $ANSWER -gt $R ]]
then
echo -e "\nIt's lower than that, guess again:"
N_OF_GUESSES=$((N_OF_GUESSES+1))
ASK
# you guessed right!
elif [[ $ANSWER -eq $R ]]
then
N_OF_GUESSES=$((N_OF_GUESSES+1))
GP=$((GP+1))
echo -e "\nYou guessed it in $N_OF_GUESSES tries. The secret number was $R. Nice job!"
UPDATE_DATA_GP=$($PSQL "UPDATE data SET games_played=$GP WHERE user_id=$USER_ID")
if [[ $BG -eq 0 ]]
then
UPDATE_DATA_BG=$($PSQL "UPDATE data SET best_game=$N_OF_GUESSES WHERE user_id=$USER_ID")
fi
if [[ $N_OF_GUESSES -lt $BG ]]
then 
UPDATE_DATA_BG=$($PSQL "UPDATE data SET best_game=$N_OF_GUESSES WHERE user_id=$USER_ID")
fi
fi
}

MAIN_MENU
