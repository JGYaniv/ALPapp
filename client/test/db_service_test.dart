import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:client/services.dart/db_service.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:math';

void main() async {
  /*Testing Code based on instructions from 
  https://github.com/tekartik/sqflite/blob/master/sqflite/doc/testing.md*/

  var rng = Random();
  final int testNumber = rng.nextInt(10000);
  WidgetsFlutterBinding.ensureInitialized();
  group(
    "DB basics",
    () {
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
              "isbn": "testISBN$testNumber",
              "title": "testTitle$testNumber",
              "author": "testAuthor$testNumber",
            },
          );

          int afterCount = Sqflite.firstIntValue(
              await db.rawQuery('SELECT COUNT(*) FROM books'));
          expect(afterCount - count, 1);
        },
      );

      test("Testing delete on books", () async {
        var db = DBService.db;
        int rowsAffected = await DBService.db.delete("books",
            where: "isbn = ?", whereArgs: ["testISBN${testNumber}"]);
        expect(rowsAffected, 1);
      });
    },
  );
  group(
    "FTS",
    () {
      DBService.deleteDB();
      final int ftsTestNumber = testNumber + 1;
      test(
        "Testing FTS books_ai",
        () async {
          Database db = DBService.db;

          await db.insert(
            "books",
            {
              "isbn": "testISBN$ftsTestNumber",
              "title": "testTitle$ftsTestNumber",
              "author": "testAuthor$ftsTestNumber",
            },
          );

          List<Map<String, Object>> results = await db.query("fts",
              columns: ["isbn"],
              where: "fts MATCH ?",
              whereArgs: ["'testTitle$ftsTestNumber'"]);

          expect(results.first["isbn"], "testISBN$ftsTestNumber");
        },
      );
      test("Testing FTS books_au", () async {
        Database db = DBService.db;

        await db.update("books", {"title": "testTitleUpdated$ftsTestNumber"},
            where: "isbn = ?", whereArgs: ["testISBN$ftsTestNumber"]);

        List<Map<String, Object>> results = await db.query("fts",
            columns: ["title"],
            where: "fts MATCH ?",
            whereArgs: ['testISBN$ftsTestNumber']);
        expect(results.first["title"], "testTitleUpdated$ftsTestNumber");
      });

      test(
        "Testing FTS books_ad",
        () async {
          Database db = DBService.db;

          await db.delete("books",
              where: "isbn = ?", whereArgs: ["testISBN$ftsTestNumber"]);

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
