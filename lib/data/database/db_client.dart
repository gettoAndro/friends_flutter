import 'package:friends_flutter/data/database/entity/friend_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseClient {
  late Database _db;

  Future create() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "database.db");

    _db = await openDatabase(path, version: 1, onCreate: _create);
  }

  Future _create(Database db, int version) async {
    await db.execute("""
            CREATE TABLE friends (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name TEXT NOT NULL,
              email TEXT,
              phone TEXT,
              avatar TEXT
            )""");
  }

  Future insert(FriendEntity friendEntity) async {
    friendEntity.id = await _db.insert("friends", friendEntity.toMap());
    print("Inserted friend = ${friendEntity.name}");
    return friendEntity;
  }

  Future<List<FriendEntity>> getFriends() async {
    List<Map> maps = await _db.query("friends");
    return maps
        .map((e) => FriendEntity(
            name: e[nameFieldName],
            email: e[emailFieldName],
            phone: e[phoneFieldName],
            avatar: e[avatarFieldName]))
        .toList();
  }

  Future<int> delete(FriendEntity friendEntity) async => await _db.delete(
          "friends",
          where: "name = ? AND phone = ? AND email = ? AND avatar = ?",
          whereArgs: [
            friendEntity.name,
            friendEntity.phone,
            friendEntity.email,
            friendEntity.avatar
          ]);
}
