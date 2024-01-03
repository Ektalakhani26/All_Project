import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE income(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    amount TEXT,
    category TEXT,
    date INTEGER
    )
    """);
    await database.execute("""CREATE TABLE profile(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        businessname TEXT,
        name TEXT,
        image TEXT
      )
      """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase(
      'ekta.db',
      version: 1,
      onCreate:(sql.Database database, version) async {
        await createTables(database);
      },
    );
  }


  static Future<int> createamount(String amount,String category,int date) async {
    final db =await SQLHelper.db();
    final data ={'amount' : amount, 'category' : category, 'date' : date};
    final id=await db.insert('income', data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  static Future<int> profileItem(String businessname , String name , String image) async {
    final db = await SQLHelper.db();

    final data = {'businessname':businessname,'name': name, 'image': image};
    final id =  db.insert('profile', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('income', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItems1() async {
    final db = await SQLHelper.db();
    return db.query('profile', orderBy: "id");
  }
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('income', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getItem1(int id) async {
    final db = await SQLHelper.db();
    return db.query('profile', where: "id = ?", whereArgs: [id], limit: 1);
  }
  static Future<int> updateItem(
      int id,String amount, String category) async {
    final db = await SQLHelper.db();

    final data = {
      'amount' : amount,
      'category' : category,
      //'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('income', data, where: "id = ?", whereArgs: [id]);
    return result;
  }


  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("income", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

}

class DB_Helper{

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE expence(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    expensamount TEXT,
    expenscategory TEXT,
    expencedate INTEGER
    )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase(
      'expences.db',
      version: 1,
      onCreate:(sql.Database database, version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createamount(String expensamount,String expenscategory,int expencedate) async {
    final db =await DB_Helper.db();
    final data ={'expensamount' : expensamount, 'expenscategory' : expenscategory, 'expencedate' : expencedate};
    final id=await db.insert('expence', data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DB_Helper.db();
    return db.query('expence', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DB_Helper.db();
    return db.query('expence', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id,String expensamount, String expenscategory) async {
    final db = await DB_Helper.db();

    final data = {
      'expensamount' : expensamount,
      'expenscategory' : expenscategory,
      //'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('expence', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DB_Helper.db();
    try {
      await db.delete("expence", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

}