import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:psico_app/app/core/helpers/formatter.dart';

mixin LocalDatabase {

  String get databaseName;
  String get tableStructure;
  String get tableName;

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, databaseName),
      onCreate: (database, version) async {
        await database.execute(tableStructure);
      },
      version: 1,
    );
  }

  Future<bool> checkColumnsDB(List columns, String table) async {
    final Database db = await initializeDB();

    var tableDescription = await db.rawQuery("PRAGMA table_info([$table]);");
    List tableColumns = [];

    tableDescription.toList().forEach((element) {
      tableColumns.add(element['name']);
    });

    if (listEquals(tableColumns, columns) == false) {
      await removeDatabase();

      return Future.value(false);
    }

    return Future.value(true);
  }

  Future<bool> removeDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);

    deleteDatabase(path);

    return Future.value(true);
  }

  Future<List<Map<String, dynamic>>> loadDatabaseData({where, whereArgs}) async {
    final Database db = await initializeDB();

    final List<Map<String, dynamic>> data = await db.query(tableName, where: where, whereArgs: whereArgs);

    return Future.value(data);
  }

  Future<bool> removeDatabaseDataById(id) async {

    final Database db = await initializeDB();

    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);

    return Future.value(true);
  }

  Future<bool> insertDatabaseData(Map<String, Object?> data, {clear}) async {
    if (hasValue(clear)) {
      await removeDatabase();
    }

    final Database db = await initializeDB();

    await db.insert(tableName, data);

    return Future.value(true);
  }

  Future<bool> updateDatabaseData(Map<String, Object?> data, {where, whereArgs}) async {
    final Database db = await initializeDB();

    await db.update(tableName, data, where: where, whereArgs: whereArgs);

    return Future.value(true);
  }
}