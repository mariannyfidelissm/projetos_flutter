import 'package:sqflite/sqflite.dart';
import '../../models/contact.dart';
import '../app_database.dart';

class ContactDao {
  static const String _tableName = "contacts";
  static const String tableSql =
      "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)";

  Future<int> save(Contact contact) async {
    Database db = await getDatabase();

    int id = await _toMap(contact, db);
    return id;
  }

  Future<int> _toMap(Contact contact, Database db) async {
    final Map<String, dynamic> contactMap = {};

    contactMap["name"] = contact.name;
    contactMap["account_number"] = contact.accountNumber;
    int id = await db.insert(_tableName, contactMap);
    return id;
  }

  Future<List<Contact>> findAll() async {
    Database db = await getDatabase();
    List<Map<String, dynamic>> results = await db.query(_tableName);
    List<Contact> contacts = _toList(results);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> results) {
    List<Contact> contacts = [];
    for (Map<String, dynamic> rowContact in results) {
      final Contact contact = Contact.fromMap(rowContact);
      //print("Conta do banco: $rowContact");
      contacts.add(contact);
    }
    return contacts;
  }
}
