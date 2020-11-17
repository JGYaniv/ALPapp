import 'package:test/test.dart';
import 'package:ALPapp/models/reader.dart';

void main() {
  group('Reader', () {
    Reader reader = new Reader(name: 'Bobby', phone: '123', address: 'nyc');
    
    test('Reader is instantiated with a name getter', () {
      expect(reader.name, 'Bobby');
    });

    test('Reader is instantiated with a phone getter', () {
      expect(reader.phone, '123');
    });
    
    test('Reader is instantiated with an address getter', () {
      expect(reader.address, 'nyc');
    });
  });
}