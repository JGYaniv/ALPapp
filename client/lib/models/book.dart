class Book {
  String title, author, isbn;

  Book({String title, author, isbn}){
    this.title = title;
    this.author = author;
    this.isbn = isbn;
  }

  //model validations

  void save() async {
    //save book to db and provider
  }

  void update() async {
    //update book details in db and provider
  }

  void delete() async {
    //delete book from db and provider
  }
}