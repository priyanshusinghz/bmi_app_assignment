import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class User {
  final int? id; 
  final String name;
  final String gender;
  final int height;
  late final int weight;
  late final DateTime date;

  User({
    this.id, 
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'height': height,
      'weight': weight,
      'date': date.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, gender: $gender, height: $height, weight: $weight, date: $date}';
  }
}


class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      gender TEXT,
      height INTEGER,
      weight INTEGER,
      date TEXT
    )
  ''');
  }

  Future<void> insertUser(User user) async {
    final Database db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getUsers() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        gender: maps[i]['gender'],
        height: maps[i]['height'],
        weight: maps[i]['weight'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  Future<User?> getLatestUser() async {
    final Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query('users', orderBy: 'date DESC', limit: 1);

    if (result.isNotEmpty) {
      return User(
        id: result[0]['id'],
        name: result[0]['name'],
        gender: result[0]['gender'],
        height: result[0]['height'],
        weight: result[0]['weight'],
        date: DateTime.parse(result[0]['date']),
      );
    } else {
      return null;
    }
  }
   Future<List<Map<String, String>>> getHistoryData() async {
    final Database db = await database;
    List<Map<String, dynamic>> data = await db.query('users', orderBy: 'date DESC');
    
    List<Map<String, String>> result = data.map((Map<String, dynamic> entry) {
      return {
        'weight': entry['weight'].toString(),
        'date': entry['date'].toString(),
      };
    }).toList();

    return result;
  }
}
