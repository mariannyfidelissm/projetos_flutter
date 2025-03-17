import 'package:path/path.dart';
import 'package:primeiro_app_flutter/06_bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, "bytebank.db");
    return openDatabase(path, onCreate: (db, version) {
      db.execute(
          "CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)");
    }, version: 1);
  });
}
Future<int> save(Contact contact){
   return createDatabase().then((db){
     final Map<String, dynamic> contactMap = {};
     contactMap["id"] = contact.id;
     contactMap["name"] = contact.name;
     contactMap["account_number"] = contact.accountNumber;
     return db.insert("contacts", contactMap);
   });
}

Future<List<Contact>> findAll(){
  return createDatabase().then((db) {

     return db.query("contacts").then((maps){
      List<Contact> contacts = [];
      for(Map<String, dynamic> map in maps){
        final Contact contact = Contact.fromMap(map);
        print("Conta do banco: $map");
        contacts.add(contact);
      }
      return contacts;

    });

  });
}