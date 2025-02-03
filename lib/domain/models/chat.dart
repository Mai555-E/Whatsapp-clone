import 'chat_model.dart';

class Chat {
  String id;
  Message? lastSeen;
  bool isGroup;
  List<String> participantId;
  DateTime? createdAt;

  Chat({required this.id, this.participantId = const [], this.createdAt, this.isGroup = false, this.lastSeen});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        id: json["id"],
        isGroup: json["isGroup"],
        lastSeen: Message.fromJson(json['lastSeen']),
        createdAt: DateTime.parse(json['createdAt']),
        participantId: List<String>.from(json['participantId']));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "isGroup": isGroup,
      "lastSeen": lastSeen?.toString(),
      "createdAt": createdAt?.toIso8601String(),
      "participantId": participantId
    };
  }
}
