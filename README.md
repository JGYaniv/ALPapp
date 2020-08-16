# ALPapp

## Version 1.0.0

## Contents
- [Introduction](#introduction)
- [Technologies](#technologies)
- [Setup](#setup)
  - [Frontend](#frontend)
  - [Backend](#backend)

## Introduction
The African Library Project App (ALPapp) is a lightweight mobile library management system (LMS) that helps librarians track their collections, request new books, and collaborate with other nearby libraries.

## Technologies
### Frontend
* [Expo](https://expo.io/)
* [Apollo Client](https://www.apollographql.com/docs/react/)
### Backend
* [Node.js](https://nodejs.org/en/)
* [graphql-yoga](https://github.com/prisma-labs/graphql-yoga)
* [Sequelize](https://sequelize.org/)
* [PostgreSQL](https://www.postgresql.org/)

## Setup
To run this project, clone it to your local machine and then run:

### Frontend
From project root directory run `cd frontend` and then run:
```
npm install
```
Tt will install all the front end dependencies. Then run:
```
npm start
```
This will run setup for both android and ios versions of the application. You can also run 'npm run android/ios' to run setup only for android or ios. 

### Backend
From project root directory run `cd server` and then run: 
```
npm install
```
Tt will install all the front end dependencies. Now run:
```
npm run server
```
This will run the node server and you can navigate to http://localhost:4000/ to view the graphql playground by graphql-yoga.



