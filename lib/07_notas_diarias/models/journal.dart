import 'package:uuid/uuid.dart';

class Journal {
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  Journal({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  Journal.empty()
      : id = Uuid().v4(),
        content = "Vazio",
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Journal.fromMap(Map<String, dynamic> mapa)
      : id = mapa["id"],
        content = mapa["content"],
        createdAt = DateTime.parse(mapa["created_at"]),
        updatedAt = DateTime.parse(mapa["updated_at"]);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "content": content,
      "created_at": createdAt.toString(),
      "updated_at": updatedAt.toString(),
    };
  }

  @override
  String toString() {
    return "$content \ncreated_at: $createdAt\nupdated_at:$updatedAt";
  }
}
