import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:client/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  /*Testing Code based on instructions from 
  https://github.com/tekartik/sqflite/blob/master/sqflite/doc/testing.md*/
  Faker faker = Faker();
  WidgetsFlutterBinding.ensureInitialized();
  group(
    "DB basics",
    () {
      String testISBN = faker.randomGenerator.string(11);
      String testAuthor = faker.person.name();
      String testTitle = faker.internet.domainName();

      DBService.deleteDB();
      test(
        "Testing initialisation",
        () async {
          await DBService.ensureInitialized();
          expect(DBService.db.isOpen, true);
        },
      );

      test(
        "Testing Insert on books",
        () async {
          Database db = DBService.db;

          int count = Sqflite.firstIntValue(
              await db.rawQuery('SELECT COUNT(*) FROM books'));

          await db.insert(
            "books",
            {
              "isbn": testISBN,
              "title": testTitle,
              "author": testAuthor,
            },
          );

          int afterCount = Sqflite.firstIntValue(
              await db.rawQuery('SELECT COUNT(*) FROM books'));
          expect(afterCount - count, 1);
        },
      );

      test("Testing delete on books", () async {
        var db = DBService.db;
        int rowsAffected =
            await db.delete("books", where: "isbn = ?", whereArgs: [testISBN]);
        expect(rowsAffected, 1);
      });
    },
  );
  group(
    "FTS",
    () {
      String testISBN = faker.randomGenerator.string(11);
      String testAuthor = faker.person.name();
      String testTitle = faker.internet.domainName();

      DBService.deleteDB();
      test(
        "Testing FTS books_ai",
        () async {
          Database db = DBService.db;

          await db.insert(
            "books",
            {
              "isbn": testISBN,
              "title": testTitle,
              "author": testAuthor,
            },
          );

          List<Map<String, Object>> results = await db.query("fts",
              columns: ["isbn"], where: "fts MATCH ?", whereArgs: [testTitle]);

          expect(results.first["isbn"], testISBN);
        },
      );
      test("Testing FTS books_au", () async {
        Database db = DBService.db;

        String updatedTestTitle = faker.internet.domainName();

        await db.update("books", {"title": updatedTestTitle},
            where: "isbn = ?", whereArgs: [testISBN]);

        List<Map<String, Object>> results = await db.query("fts",
            columns: ["title"], where: "fts MATCH ?", whereArgs: [testISBN]);
        expect(results.first["title"], updatedTestTitle);
      });

      test(
        "Testing FTS books_ad",
        () async {
          Database db = DBService.db;

          await db.delete("books", where: "isbn = ?", whereArgs: [testISBN]);

          List<Map<String, Object>> results = await db.query("fts",
              columns: ["title"],
              where: "fts MATCH ?",
              whereArgs: ["'testTitle*'"]);

          expect(results.length, 0);
        },
      );
    },
  );
}
