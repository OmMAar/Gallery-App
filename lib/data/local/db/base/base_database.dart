import 'package:nabed_test/data/local/constants/db_constants.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/models/user/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BaseDatabase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(DBConstants.DB_SQ_NAME);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final textTypeNotNullWithUnique = 'TEXT NOT NULL UNIQUE';
    final textTypeNotNull = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN';
    final integerType = 'INTEGER';

    await db.execute('''
CREATE TABLE ${DBConstants.TABLE_LIST_OF_USERS} ( 
  ${UserFields.id} $idType, 
  ${UserFields.email} $textTypeNotNullWithUnique,
  ${UserFields.password} $textTypeNotNull,
  ${UserFields.fullName} $textTypeNotNull
  )
''');

    await db.execute('''
CREATE TABLE ${DBConstants.TABLE_LIST_OF_ITEM} ( 
  ${ItemFields.id} $integerType, 
  ${ItemFields.pageURL} $textType,
  ${ItemFields.type} $textType,
  ${ItemFields.tags} $textType,
  ${ItemFields.previewURL} $textType,
  ${ItemFields.previewWidth} $integerType,
  ${ItemFields.previewHeight} $integerType,
  ${ItemFields.webformatURL} $textType,
  ${ItemFields.webformatWidth} $integerType,
  ${ItemFields.webformatHeight} $integerType,
  ${ItemFields.largeImageURL} $textType,
  ${ItemFields.imageWidth} $integerType,
  ${ItemFields.imageHeight} $integerType,
  ${ItemFields.imageSize} $integerType,
  ${ItemFields.views} $integerType,
  ${ItemFields.downloads} $integerType,
  ${ItemFields.collections} $integerType,
  ${ItemFields.likes} $integerType,
  ${ItemFields.comments} $integerType,
  ${ItemFields.userId} $integerType,
  ${ItemFields.user} $textType,
  ${ItemFields.userImageURL} $textType
  )
''');
  }

  Future close() async {
    final db = await database;

    db.close();
  }
}
