# JasonSandeman_T1A3

## Source Code

View the source code on GitHub [here](https://github.com/jwsandeman/JasonSandeman_T1A3)

## Installation

```
installation script??
```

## Software Development Plan

### 1. Purpose & Scope

I will be building a recipe suggestion app based on the parameters that a user inputs. The app asks the user what ingredients they currently have in their cupboards/fridge and then suggests relevant recipes based on matching ingredients. Any ingredients that the user is missing from the recipe is automatically added to a shopping list to make it easy to reference when shopping. They can also view the instructions for for their chosen recipes.

The problem this app is solving is simple. It helps users quickly find recipes based on what ingredients they already have at home and reduces the amount of ingredients they have to go out and buy. This is necessary to prevent users from wasting time finding recipes that involve ingredients they dont have at home and prevents them from doubling up on ingredients that they already have.

#### Target Audience

The target audience is anyone who needs ideas for what to cook but don't want to have to go out and buy all of the ingredients.

The user will run the app and choose from a list of the ingredients selecting the ones they currently have at home. Then a list of relevant recipes will be shown and they will then choose the recipes they like from the matching options provided. Once they select the recipes they like they will be added to their recipes which they can view to see the cooking instructins. Now they will be able to view their shopping list which is based on items that they are missing.

### 2. List of Features

#### Menu Options

When a user first runs the app they will be shown a list of menu items that they can interact with.

#### Select My Ingredients

Users can view a list of ingredients and select the ingredients that they currently have in their cupboard/fridge. Extra Credit - Users will be able to remove ingredients if they made a mistake or clear the entire list to start again.

#### View Matching Recipes

Once Users have selected their ingredients they will be able to view their matching recipes which will be populated based on how many ingredients match. The list will be sorted in descending order starting with recipes with the most matched ingredients. Users will be able to select as many recipes as they want and add them to their selected recipes.

#### View My Recipes

Users will then be able to view a list of the recipes that they have selected select a recipe to view the instructions on how to cook it. Extra Credit - Users will be able to remove recipes if they made a mistake or clear the entire recipe list.

#### View Shopping List

Once user have added recipes they will be bale to view all of the ingredients required to make all of the recipes they have selected. Extra Credit - each ingredient on the shopping list will have the related recipe in brackets next to it for quick reference.

### 3. User interaction and experience

The user will be greeted by a welcome screen and prompted to enter their name. Once they do this they will be given a greeting prompt explaining how to interact with the menu options. This will form the basis for all user interactions in the app.

When a user first runs the app they will be shown a list of menu items that they can interact with. I will be using TTY-Prompt to achieve this functionality and they will be able to navigate these options using the arrow "keys" and select options using the "enter" key. I will be using the same navigation system when users are selecting ingredients, selecting recipes, viewing recipes and viewing the shopping list.

The reason i am using TTY-Prompt for most of my user input is to simplify the user experience but also it comes with the added benefit of error handling as users are limited in what they can actually input/select. If they dont select the correct option or input an in invalid option they will receive a prompt on the screen indicatng that they have made an error and that they should try again. Errors will be displayed in red using colorize.

### 4. Control Flow Diagram

diagram must show the workflow/logic and/or integration of the features in your application for each feature

utilise a recognised format or set of conventions for a control flow diagram, such as UML.

### 5. Implementation Plan

outlines how each feature will be implemented and a checklist of tasks for each feature

prioritise the implementation of different features, or checklist items within a feature

provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

Utilise a suitable project management platform to track this implementation plan

Your checklists for each feature should have at least 5 items.

### 6. Help Documentation

set of instructions that accurately describe how to use and install the application

steps to install the application

any dependancies required by the appication to operate

any system/hardware requirements
