import 'package:path/path.dart';
import 'package:primeiro_app_flutter/06_bytebank/database/dao/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String pathDatabase = await getDatabasesPath();
  String path = join(pathDatabase, "bytebank.db");
  Database db = await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
          ContactDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete
  );
  return db;
}
