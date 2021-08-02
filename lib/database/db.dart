import 'package:onboard/model/transcation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class nafadb {
  nafadb._privateConstructor();
  static final nafadb instance = nafadb._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'transcations.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transcations(
          id INTEGER PRIMARY KEY,
          invoice TEXT,
          date TEXT,
          title TEXT,
          rate TEXT,
          total TEXT

      )
      ''');
    await db.execute('''
      CREATE TABLE kharcha(
          id INTEGER PRIMARY KEY,
          invoice TEXT,
          date TEXT,
          title TEXT,
          rate TEXT,
          total TEXT

      )
      ''');
  }

  Future<List<Transcation>> getGroceries() async {
    Database db = await instance.database;
    var transcations = await db.query('transcations', orderBy: 'id');
    List<Transcation> nafaList = transcations.isNotEmpty
        ? transcations.map((c) => Transcation.fromMap(c)).toList()
        : [];
    return nafaList;
  }

  Future<int> add(Transcation nafa) async {
    Database db = await instance.database;
    return await db.insert('transcations', nafa.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('transcations', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Transcation nafa) async {
    Database db = await instance.database;
    return await db.update('transcations', nafa.toMap(),
        where: "id = ?", whereArgs: [nafa.id]);
  }

  ///********Kharcha Database starts */
  Future<List<Transcation>> getKharcha() async {
    Database db = await instance.database;
    var kharcha = await db.query('kharcha', orderBy: 'id');
    List<Transcation> kharchaList = kharcha.isNotEmpty
        ? kharcha.map((c) => Transcation.fromMap(c)).toList()
        : [];
    return kharchaList;
  }

  Future<int> create(Transcation nafa) async {
    Database db = await instance.database;
    return await db.insert('kharcha', nafa.toMap());
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete('kharcha', where: 'id = ?', whereArgs: [id]);
  }

  // Future<int> update(Transcation nafa) async {
  //   Database db = await instance.database;
  //   return await db.update('transcations', nafa.toMap(),
  //       where: "id = ?", whereArgs: [nafa.id]);
  // }

}
