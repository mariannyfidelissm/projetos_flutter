import 'package:uuid/uuid.dart';

class Journal {
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;

  Journal({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  Journal.empty({required int userI})
      : id = Uuid().v4(),
        content = "Vazio",
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        userId = userI;

  Journal.fromMap(Map<String, dynamic> mapa)
      : id = mapa["id"],
        content = mapa["content"],
        createdAt = DateTime.parse(mapa["created_at"]),
        updatedAt = DateTime.parse(mapa["updated_at"]),
        userId = mapa["userId"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "content": content,
      "created_at": createdAt.toString(),
      "updated_at": updatedAt.toString(),
      "userId": userId,
    };
  }

  @override
  String toString() {
    return "$content \ncreated_at: $createdAt\nupdated_at:$updatedAt\nuserId:$userId";
  }
}
