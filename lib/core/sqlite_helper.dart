import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHeper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await inizalizeDb();
      return _db;
    } else {
      return _db;
    }
  }

  inizalizeDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'khwater.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 3);
    return mydb;
  }

  _onCreate(Database db, int verson) async {
    await db.execute('''
   CREATE TABLE "categoris" (
  "categories_id" INTEGER NOT NULL,
  "categorie_status" INTEGER NOT NULL,
  "categorie" TEXT NOT NULL
)
   ''');
    await db.execute('''
   CREATE TABLE "messages" (
  "message_id" INTEGER NOT NULL,
  "message" TEXT NOT NULL,
  "message_status" INTEGER NOT NULL,
  "is_new" INTEGER NOT NULL,
  "spical" INTEGER NOT NULL,
  "id_categorie" INTEGER NOT NULL
)
  
   ''');
    await db.execute('''
   CREATE TABLE "faviorte" (
  "faviorte_id" INTEGER NOT NULL,
  "isFaviorte" INTEGER DEFAULT 0
)
   ''');
    log('crated');
  }

  readdata(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertdata(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  deletdata(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
  uPdatedata(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  addMessage(dynamic testingModel) async {
    final db = _db;
    final res = await db?.insert('messages', testingModel);

    return res;
  }
   addFaviorte(dynamic faviorte) async {
    final db = _db;
    final res = await db?.insert('faviorte', faviorte);

    return res;
  }

  updateMessage(Map<String, dynamic> messages, int id) async {
    final db = _db;
    final res = await db?.update('messages', messages, where: 'message_id=$id');

    return res;
  }

  addCategorie(dynamic categorie) async {
    final db = _db;
    final res = await db?.insert('categoris', categorie);

    return res;
  }

  addFaviore(Map<String,dynamic> faviorte) async {
    final db = _db;
    final res = await db?.insert('faviorte', faviorte);

    return res;
  }

  mydeletedatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'khwater.db');
    await deleteDatabase(path);
  }
}
