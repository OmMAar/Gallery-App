import 'package:nabed_test/data/local/constants/db_constants.dart';
import 'package:nabed_test/data/local/db/base/base_database.dart';
import 'package:nabed_test/models/gallery/hits_local_model.dart';

class ItemDatabase {

  // database instance
  final BaseDatabase _db;


  // Constructor
  ItemDatabase(this._db);

  Future<HitsLocalModel> create(HitsLocalModel item) async {
    final db = await _db.database;

    final id = await db.insert(DBConstants.TABLE_LIST_OF_ITEM, item.toJson());
    return item.copy(id: id);
  }

  Future<HitsLocalModel> readItem(int id) async {
    final db = await _db.database;

    final maps = await db.query(
      DBConstants.TABLE_LIST_OF_ITEM,
      columns: ItemFields.values,
      where: '${ItemFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return HitsLocalModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<HitsLocalModel>> readAllItems() async {
    final db = await _db.database;

    // final orderBy = '${ItemFields.comments} ASC';

    final result = await db.query(DBConstants.TABLE_LIST_OF_ITEM);

    return result.map((json) => HitsLocalModel.fromJson(json)).toList();
  }

  Future<int> update(HitsLocalModel note) async {
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
