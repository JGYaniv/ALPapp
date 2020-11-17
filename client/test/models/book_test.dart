import 'package:test/test.dart';
import 'package:ALPapp/models/book.dart';

void main() {
  group('Book', () {
    Book book = new Book(title: 'Tables', author: 'Bobby', isbn: '123');
    
    test('Book is instantiated with a title getter', () {
      expect(book.title, 'Tables');
    });

    test('Book is instantiated with a author getter', () {
      expect(book.author, 'Bobby');
    });
    
    test('Book is instantiated with an isbn getter', () {
      expect(book.isbn, '123');
    });
  });
}