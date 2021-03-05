import 'dart:async';
import 'package:shared_preference/Model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

abstract class DB {
  static Database _db;
  static int get _version => 1;
  static Future<void> init() async {
    if (_db != null) {
      return;
    }
    try {
      var databasesPath = await getDatabasesPath();
      String _path = p.join(databasesPath, 'video.db');
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    // await db.execute(
    //     'CREATE TABLE videos (id INTEGER PRIMARY KEY AUTOINCREMENT, videoName STRING, video STRING, thumbnail BLOB,subtitle STRING)');
    // await db.execute(
    //     'CREATE TABLE words (id INTEGER PRIMARY KEY AUTOINCREMENT, words String, translations String)');
    await db.execute(
        'CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT,firstName STRING,lastName STRING)');
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);
  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());
  static Future<int> update(String table, Model model) async => await _db
      .update(table, model.toMap(), where: 'id=?', whereArgs: [model.id]);
  static Future<int> delete(String table, Model model) async =>
      await _db.delete(table, where: 'id=?', whereArgs: [model.id]);

  static Future<Batch> batch() async => _db.batch();
}
