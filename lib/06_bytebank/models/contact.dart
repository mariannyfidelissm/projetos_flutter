class Contact {
  //final int id;
  final String name;
  final int accountNumber;

  Contact(
  //this.id,
    this.name,
    this.accountNumber
  );

  @override
  String toString() {
    return 'Contact { name: $name, accountNumber: $accountNumber}';
  }

  static Contact fromMap(Map<String, dynamic> map) {
    return Contact(
      //map["id"],
      map["name"],
      map["account_number"],
    );
  }
}
