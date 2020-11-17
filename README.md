# ALPapp

## Version 0.1.0

## Contents

- [Introduction](#introduction)
- [Technologies](#technologies)
- [Setup](#setup)

## Introduction

The African Library Project App (ALPapp) is a lightweight mobile library management system (LMS) that helps librarians track their collections, request new books, and collaborate with other nearby libraries.

## Technologies

- [Flutter](https://flutter.dev/)
- [sqflite](https://pub.dev/packages/sqflite)
- [provider](https://pub.dev/packages/provider)
- [graphql_flutter](https://pub.dev/packages/graphql_flutter)
- [alpappapi](https://github.com/JGYaniv/alpappapi) (our api)

## Setup

To run this project, clone it to your local machine and then run:

From project root directory run `cd client` and then run:

```
npm install
```

Tt will install all the front end dependencies. Then run:

```
npm start
```

This will run setup for both android and ios versions of the application. You can also run `npm run android/ios` to run setup only for android or ios.

## Documentation for pilot model

### Authentication

- For demo model we assume that the user signs in with email, password and choses a library from a dropdown menu.
- User should log in only once
- Questions TBD:
  - Should the user be able to create a library or to join a library usig an invitation code?
  - Should an Admin approve a new user?
  - How to avoid discreapcy if there are several librarians using the app at the same time?

### Header has one button for settings

- TBD

### Footer has 3 buttons

- Book - link to the index page
- Plus - link to the main page
- Sync - the button to synchronize the app

### Main page

- This is the page you see when open the app
- It has 3 buttons:
- Check out
- Check in
- Add New
- All these buttons redirect you to the scan page with different use cases

### Scan page

- The user is able to scan the barcode and on success ISBN will appear in the input field
- The user should be able to type in the ISBN manually
- If Check out
- The user is redirected to a checkout show page where they can see how many books are available
- If they press continue they will be redirected to a page where they can select a copy of the book (unique number)
- Then they are redirected to a checkout form where they type in the reader's information
- If Check in
- Show page -> Select copy -> Check in
- If Add New Book
- After scaning they are redirected to a screen where they see how many copies of this book exist and creates a unique id (suggested id - book number, like 2 for the second book)

### Index page

- List of all books
- Search field on top
  - Should be able to search by Author, Title, ISBN
- On click the user is redirected to the show page of the target book
  - Show page with the book data -> Select copy -> Checkout history for the book

### Sync page

- On click should sync the app with the server side db
- If the user is using mobile data the alert pops up
  - Synchronize anyway / Synchronize later
