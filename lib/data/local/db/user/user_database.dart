import 'package:nabed_test/data/local/constants/db_constants.dart';
import 'package:nabed_test/data/local/db/base/base_database.dart';
import 'package:nabed_test/models/user/user_model.dart';

class UserDatabase {
  // database instance
  final BaseDatabase _db;

  // Constructor
  UserDatabase(this._db);

  Future<UserModel> create(UserModel user) async {
    final db = await _db.database;

    final id = await db.insert(DBConstants.TABLE_LIST_OF_USERS, user.toJson());
    print("new user added with id : $id");
    return user.copy(id: id);
  }

  Future<UserModel?> accountExists(
      {required String email, required String password}) async {
    final db = await _db.database;

    var res = await db.rawQuery(
        "SELECT * FROM ${DBConstants.TABLE_LIST_OF_USERS} WHERE ${UserFields.email} = '$email' and ${UserFields.password} = '$password'");

    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }

    return null;
  }

  Future<UserModel> readNote(int id) async {
    final db = await _db.database;

    final maps = await db.query(
      DBConstants.TABLE_LIST_OF_USERS,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<UserModel>> readAllNotes() async {
    final db = await _db.database;

    final orderBy = '${UserFields.fullName} ASC';

    final result =
        await db.query(DBConstants.TABLE_LIST_OF_USERS, orderBy: orderBy);

    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<int> update(UserModel note) async {
    final db = await _db.database;

    return db.update(
      DBConstants.TABLE_LIST_OF_USERS,
      note.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await _db.database;

    return await db.delete(
      DBConstants.TABLE_LIST_OF_USERS,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await _db.database;

    db.close();
  }
}
