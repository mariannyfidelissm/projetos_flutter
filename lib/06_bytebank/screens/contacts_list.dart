import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/06_bytebank/database/app_database.dart';
import '../models/contact.dart';
import 'contact_form.dart';

class ContactsList extends StatelessWidget {
  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: [],
          future:
              Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                ));
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Erro ao carregar dados do Banco de dados');
                } else {
                  if (snapshot.hasData) {
                    contacts = snapshot.data as List<Contact>;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return _ContactItem(contacts[index]);
                      },
                      itemCount: contacts.length,
                    );
                  } else {
                    return Text('Não tem dados no Banco de dados');
                  }
                }
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (newContact) => debugPrint(newContact.toString()),
              );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
