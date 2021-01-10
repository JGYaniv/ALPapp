import 'package:flutter/material.dart';
import 'package:ALPapp/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

class Search extends SearchDelegate {
  Database _db = DBService.instance.db;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: null,
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop());
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: _buildResults(query),
      builder: (context, AsyncSnapshot<List<Map>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: snapshot.data.map((e) => Text(e["title"])).toList(),
          );
        }
      },
    );
  }

  Future<List<Map>> _buildResults(String searchString) async {
    var results = await _db.query("fts",
        columns: ["title, author"],
        where: "fts MATCH ?",
        whereArgs: ["'$searchString*'"]);

    return results;
  }
}
