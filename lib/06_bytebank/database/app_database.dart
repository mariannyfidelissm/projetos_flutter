import 'package:path/path.dart';
import 'package:primeiro_app_flutter/06_bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String pathDatabase = await getDatabasesPath();
  String path = join(pathDatabase, "bytebank.db");
  Database db = await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
          "CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)");
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete
  );
  return db;
}

Future<int> save(Contact contact) async {
  Database db = await getDatabase();

  final Map<String, dynamic> contactMap = {};

  contactMap["name"] = contact.name;
  contactMap["account_number"] = contact.accountNumber;
  int id = await db.insert("contacts", contactMap);
  // contactMap["id"] = id;
  return id;
}

Future<List<Contact>> findAll() async {
  Database db = await getDatabase();
  List<Map<String, dynamic>> results = await db.query("contacts");

  List<Contact> contacts = [];
  for (Map<String, dynamic> row_contact in results) {
    final Contact contact = Contact.fromMap(row_contact);
    print("Conta do banco: $row_contact");
    contacts.add(contact);
  }
  return contacts;
}
