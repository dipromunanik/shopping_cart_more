import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{

  static const db_name = 'product.db';
  static const db_version = 1;
  static const table_name = 'item';

  static Database? _database;

  DBHelper._privateConstructor();

  static final DBHelper instance = DBHelper._privateConstructor();


  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{

    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,db_name);

    return await openDatabase(path,version: db_version,onCreate: _onCreate);
  }
  Future _onCreate(Database db,int version) async{
    await db.execute(
      '''
      CREATE TABLE $table_name(
      
      
      
      )
      '''
    );
  }


  Future<int?> insert(Map<String,dynamic> row) async{
    Database? db = await instance.database;

    return await db!.insert(table_name, row);

  }
  Future<List<Map<String,dynamic>>> queryAll() async{

    Database? db = await instance.database;

    return await db!.query(table_name);

  }
}