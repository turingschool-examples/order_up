# Order Up

Fork this repository and clone your newly created repository. At the end of the challenge, push your code to your repository and create a pull request to this repository.

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `rails db:{create,migrate,seed}`
---
### Submission

When you have completed this challenge, submit by creating a Pull Request back to the turingschool-examples repo. Include the following information:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through
---
### Requirements

* TDD all new work
* any model METHODS you write must be fully tested.
* any model RELATIONSHIPS you create must be fully tested.
---
### Not Required

* No visual styling is required or expected
* No model testing for validations are required
---

### Challenge Description

Order up is an app that tracks chefs, the dishes that they make, and the ingredients that are in those dishes. Chef's have many dishes. Dishes belong to a chef. Dishes have many Ingredients and Ingredients have many dishes. Ingredients should have a name and calories.

Two migrations have been made for you. The one to many relationship has been set up. You will need to create migrations for the many to many relationship between ingredients and dishes. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create.

(Note: The plural of dish is dishes. The plural of chef is chefs.)

## User Stories

## Overview

Order up is an app that tracks chefs, the dishes that they make, and the ingredients that are in those dishes. Chef's have many dishes. Dishes belong to a chef. Dishes have many Ingredients and Ingredients have many dishes. Ingredients should have a name and calories.
 
Two migrations have been made for you. The one to many relationship has been set up. You will need to create migrations for the many to many relationship between ingredients and dishes. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create.
 
(Note: The plural of dish is dishes. The plural of chef is chefs.)
 
## Instructions

* Work on this challenge independently.
* Complete the stories below
* Commit Frequently
* Push your code to your fork once the time is up (not before!)


## User Stories

```
Story 1 of 3
As a visitor
When I visit a dish's show page
I see the dish’s name and description
And I see a list of ingredients for that dish
And I see the chef's name
 ```
 
 ```
Story 2 of 3
As a visitor
When I visit a dish's show page
I see the total calorie count for that dish.
 ```
 ```
Story 3 of 3
As a visitor
When I visit a chef's show page
I see the name of that chef
And I see a link to view a list of all ingredients that this chef uses in their dishes
When I click on that link
I'm taken to a chef's ingredient index page
and I can see a unique list of names of all the ingredients that this chef uses
 ```
 
 ## Extensions
 
 ```
Extension
As a visitor
When I visit a chef's show page
I see the three most popular ingredients that the chef uses in their dishes
(Popularity is based off of how many dishes use that ingredient)
```
