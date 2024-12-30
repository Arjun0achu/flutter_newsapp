import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SavedNewsController with ChangeNotifier {
  static late Database database;
  List<Map> savedNews = [];

  static Future<void> initializeDatabase() async {
    database = await openDatabase(
      "SavedNews.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE News (id INTEGER PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
    );
  }

  Future<void> addNews({
    required BuildContext context,
    required String title,
    required String image,
  }) async {
    await getSavedNews();
    bool alreadyAdded = false;

    for (int i = 0; i < savedNews.length; i++) {
      if (savedNews[i]["title"] == title) {
        alreadyAdded = true;
        break;
      }
    }

    if (!alreadyAdded) {
      await database.rawInsert(
        'INSERT INTO News(title, image) VALUES(?, ?)',
        [title, image],
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("News Bookmarked"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("News Already Bookmarked"),
        ),
      );
    }

    notifyListeners();
    log(savedNews.toString());
  }

  Future<void> removeNews({required int id}) async {
    await database.rawDelete('DELETE FROM News WHERE id = ?', [id]);
    await getSavedNews();
    notifyListeners();
  }

  Future<void> getSavedNews() async {
    savedNews = await database.rawQuery('SELECT * FROM News');
    log(savedNews.toString());
    notifyListeners();
  }
}
