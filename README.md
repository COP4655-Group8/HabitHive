Original App Design Project - README Template
===

# HabitHive

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

HabitHive is a habit-tracking app that helps users build positive routines by gamifying the experience. Users can set personal goals, track progress, and earn rewards for consistency.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Health, Social
- **Mobile:** App is mobile only for now.
- **Story:** This app tells the story of personal growth through positive habit-building. It takes users on a journey of self-improvement, where every small step contributes to a larger goal. This journey is presented in a game-like fashion, making the process engaging rather than a chore.
- **Market:** Self-improvement enthusiasts, young adults, mental wellness advocates
- **Habit:** App is designed to be used daily.
- **Scope:** Feature wise, it won't be too broad, as it's main purpose is to track the user's habits. Other features will supplement this, such as those that gamify the experience.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [User can register an account and log in]
* [User can access the app's main screen, with different tabs (such as the habits tab)]
* [User can create habits and track their progress]
* [User can set goals with their habits, such as doing it 5 days in a row]
* [User gets rewarded in some way for completing habits]
* [User can use rewards, such as points, to redeem something]
<!-- More can be added to this and optional stories if needed!     !-->

**Optional Nice-to-have Stories**

* [User can customize profile, such as changing avatar]
* [User unlocks achievements to give further incentive]
* [User can select between a light and dark mode]

### 2. Screen Archetypes

- [ ] [**Login Screen**]
* [Required User Feature: User can log in.]
- [ ] [**Register Screen**]
* [Required User Feature: User can register an account.]
- [ ] [**Home Screen**]
* [Required User Feature: User can access the home, or main menu.]
- [ ] [**Habit Creation Screen**]
* [Required User Feature: User can create habits.]
- [ ] [**Habit List Screen**]
* [Required User Feature: User can view created habits.]
- [ ] [**Points Shop Screen**]
* [Required User Feature: User can redeem their points for rewards.]

### 3. Navigation

**Tab Navigation** (Tab to Screen)


- [ ] [First Tab, Home Feed]
- [ ] [Second Tab, Habits]
- [ ] [Third Tab, Shop]
- [ ] [Fourth Tab, (optional) Achievements]
<!-- More can be added to this if needed!  !-->


**Flow Navigation** (Screen to Screen)

- [ ] [**Login Screen**]
  * Leads to [**Home Screen or Register Screen**]
- [ ] [**Home Screen**]
  * Leads to [**Habit List Screen**]
  * Leads to [**Points Shop Screen**]
  * Possibly leads to [**Achievements Screen**]
- [ ] [**Habit List Screen**]
  * Leads to [**Habit Creation Screen**]


## Wireframes

[Add picture of your hand sketched wireframes in this section]

![image](https://hackmd.io/_uploads/ByAXl_2gJl.png)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 


### Models

[Model Name, e.g., User]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)   |
| password | String | user's password for login authentication      |
| ...      | ...    | ...                          


### Networking

- [List of network requests by screen]
- [Example: `[GET] /users` - to retrieve user data]
- ...
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
