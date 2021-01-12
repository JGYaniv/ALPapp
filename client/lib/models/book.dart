class Book {
  //Follow order: isbn, title, isbn
  String isbn, title, author;

  Book({this.isbn, this.title, this.author});

  Book.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    isbn = json["isbn"];
    author = json["author"];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "isbn": isbn,
      "title": title,
      "author": author,
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);
  }
}
