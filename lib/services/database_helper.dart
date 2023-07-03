import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableName = 'user';
  final String columnId = 'id';
  final String columnName = 'username';
  final String columnPassword = 'password';

  Database? _db;

  Future<Database> get db async {
    _db ??= await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(appDirectory.path, 'data', 'user.db');

    var ourDb = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnPassword TEXT)');
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert(tableName, user.toMap());
    return res;
  }

  Future<User?> getUser(String username) async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query(
      tableName,
      columns: [columnId, columnName, columnPassword],
      where: '$columnName = ?',
      whereArgs: [username],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
