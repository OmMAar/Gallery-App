import 'package:nabed_test/data/local/constants/db_constants.dart';
import 'package:nabed_test/data/local/db/base/base_database.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:sqflite/sqflite.dart';

class ItemDatabase {
  // database instance
  final BaseDatabase _db;

  // Constructor
  ItemDatabase(this._db);

  Future<HitsModel> create(HitsModel item) async {
    final db = await _db.database;

    final id = await db.insert(DBConstants.TABLE_LIST_OF_ITEM, item.toJson());
    print("Item with id :${item.id} inserted successfully with id sql : $id");
    return item;
  }

  Future<int?> getCount() async {
    final db = await _db.database;
    var x = await db
        .rawQuery('SELECT COUNT (*) from ${DBConstants.TABLE_LIST_OF_ITEM}');
    int count = Sqflite.firstIntValue(x)!;
    return count;
  }

  Future<List<HitsModel>?> getPagingItems(
      {required int page, int pageSize = 20}) async {
    final db = await _db.database;
    var items = await db.rawQuery(
        'SELECT * from ${DBConstants.TABLE_LIST_OF_ITEM} LIMIT ${(page - 1) * pageSize}, $pageSize ');
    return items.map((json) => HitsModel.fromJson(json)).toList();
  }

  Future<HitsModel> readItem(int id) async {
    final db = await _db.database;

    final maps = await db.query(
      DBConstants.TABLE_LIST_OF_ITEM,
      columns: ItemFields.values,
      where: '${ItemFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return HitsModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<HitsModel>> readAllItems() async {
    final db = await _db.database;

    // final orderBy = '${ItemFields.comments} ASC';

    final result = await db.query(DBConstants.TABLE_LIST_OF_ITEM);

    return result.map((json) => HitsModel.fromJson(json)).toList();
  }

  Future<int> update(HitsModel note) async {
    final db = await _db.database;

    return db.update(
      DBConstants.TABLE_LIST_OF_ITEM,
      note.toJson(),
      where: '${ItemFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await _db.database;

    return await db.delete(
      DBConstants.TABLE_LIST_OF_ITEM,
      where: '${ItemFields.id} = ?',
      whereArgs: [id],
    );
  }
}
