#!/bin/bash

read -p "please enter your names:" user_names

read -p "please enter your assignment names:" assignment_names

subdir="submission_reminder_$user_names"

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_names\"/" "$subdir/config/config.env"

bash "$subdir/startup.sh"
