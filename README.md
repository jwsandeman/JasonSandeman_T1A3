# JasonSandeman_T1A3 - Terminal Application

A recipe suggestion app written using ruby.

## 🔗 Links

View the source code on GitHub [here](https://github.com/jwsandeman/JasonSandeman_T1A3)

View my Notion Project Management Dashboard [here](https://jwsandeman.notion.site/T1A3-Terminal-Application-efe7f174b7fa4dd69b60a83e1c0847ab)

[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://festive-aryabhata-690f3c.netlify.app/index.html)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jason-sandeman-33268496/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/jwsandeman)

## Installation

Clone the project

```bash
  git clone https://github.com/jwsandeman/JasonSandeman_T1A3.git
```

Go to the project directory

```bash
  cd JasonSandeman_T1A3
```

Install dependencies and run application

```bash
  ./install.sh
```


## Software Development Plan

### 1. Purpose & Scope

I will be building a recipe suggestion app based on the selections that a user makes. The app will ask the user what ingredients they currently have at home and then suggest relevant recipes based on matching ingredients. These matching recipes will be displayed in a list with how many matching ingredients each recipe has. Any ingredients that the user is missing from the recipe is automatically added to a shopping list to make it easier to reference when shopping. They will also be able to view the cooking instructions for each of their chosen recipes.

#### Why Build It

This app helps users quickly find recipes based on what ingredients they already have at home and reduces the amount of ingredients they have to go out and buy. This prevents users from wasting time finding recipes that involve ingredients they dont have at home which is a very common and very frustrating problem. It also helps prevent them from doubling up on ingredients when shopping for multiple recipes as it tells the user exactly how much of each ingredient they need for each recipe.

#### Target Audience

The target audience is anyone looking for ideas of what to cook based on the ingredients they already have at home and any ingredients that they need will be added to a handy shopping list for quick reference.

#### How To Use It

Following the installation instructions above, and once all the dependencies have been installed, the application will run. Once the application is running users will be able to navigate through the menus using the directional arrows and the enter key. The app will also prompt the user to answer questions as necessary. Once the user has finished using the application they will be able to select "Exit" from the main menu to close the application.

### 2. Features

When a user first runs the app they will be presented with an interactive menu of options displaying the following features:
    - Select Ingredients - This is where you select ingredients you currently have at home. You can add or remove as many ingredients as you want.
    - Matching Recipes - This shows a list of recipes that match your ingredients. You can select as many recipes as you want. You can also remove recipes if you change your mind.
    - My Recipes - Here you can view your recipes and then select a recipe to view the cooking instructions for that recipe.
    - Shoppig List - This is a list of all of the ingredients that are missing from your selected recipes.
    - Exit - This will close the application.

#### Select Ingredients

Users can view a list of ingredients that is populated from all available recipes. They will be able to select the ingredients that they currently have in their cupboard/fridge. Users will also be able to remove ingredients if they make a mistake or change their mind.

#### Matching Recipes

Once Users have selected their ingredients they will be able to view their matching recipes which will be populated based on how many of their selected ingredients match those of the recipes. The list will be sorted in descending order starting with recipes with the most matched ingredients. Users will be able to select as many recipes as they want and add them to their selected recipes (My Recipes).

#### My Recipes

Users will then be able to view the list of the recipes that they have selected. They will have the option to select an individual recipe and view the instructions on how to prepare and cook it. Users will be able to remove recipes if they made a mistake or change their mind.

#### Shopping List

Once users have added recipes they will be bale to view all of the missing ingredients that are required to make the recipes they have selected. Each ingredient on the shopping list will have the related recipe in brackets next to it for quick reference.

### 3. User Interaction and Experience

The user will be greeted by a welcome screen and prompted to enter their name. Once they do this they will be given a greeting prompt explaining how to interact with the menu options. This will form the basis for all user interactions in the app.

When a user first runs the app they will be shown a list of menu items that they can interact with. I will be using TTY-Prompt to achieve this functionality and they will be able to navigate these options using the arrow "keys" and select options using the "enter" key. I will be using the same navigation system when users are selecting ingredients, selecting recipes, viewing recipes and viewing the shopping list.

The reason i am using TTY-Prompt for most of my user input is to simplify the user experience but also it comes with the added benefit of error handling as users are limited in what they can actually input/select. If they dont select the correct option or input an in invalid option they will receive a prompt on the screen indicatng that they have made an error and that they should try again. Errors will be displayed in red using colorize.

### 4. Control Flow Diagram

![Terminal Application Control Flow Diagram](./docs/Terminal%20App%20Control%20Flow.png)

Here is a [Link](https://whimsical.com/terminal-app-control-flow-XJLcP7uFDbPyKQayBbWVLs@7YNFXnKbYeumqm8HZNhB9) to my Control Flow Diagram on Whimsical. 

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

## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)


## Support

For support, email fake@fake.com or join our Slack channel.
