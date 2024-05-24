#!/bin/bash

# Get the current date
current_date=$(date +"%m-%d-%y")
current_day=$(date +"%a %b %d %Y")
dir="/home/chuckg/Notes/ut-website/Writings/Private/todo"
# Define the template
read -r -d '' TEMPLATE << EOM
---
title: "$current_day"
date: "$current_date"
return-url: 'dir.html'
return-text: '← Return'
---

# Daily Goal

Provide a brief description of the overall goal for this day.

# Tasks

## To Do

- [ ] Task 1
    - Description of Task 1
    - Additional notes or subtasks

## In Progress

## Completed

# Daily Retrospective

Provide a summary of the day, including what went well, what could be improved, and any action items for the next day.

# Notes

- Use this section for any additional notes, ideas, or reminders related to the sprint or tasks.
- You can also include links to relevant resources or documentation here.
EOM

# Write the template to a new file
echo "$TEMPLATE" > "$dir/todo-$current_date.md"
