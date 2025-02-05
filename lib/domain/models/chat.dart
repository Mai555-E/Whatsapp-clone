import 'message.dart';

class Chat {
  final String id;
  final bool isGroup;
  final Message? lastSeen;
  final DateTime? createdAt;
  final List<String> participantId;

  const Chat({
    required this.id,
    this.lastSeen,
    this.createdAt,
    this.isGroup = false,
    this.participantId = const [],
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json["id"],
      isGroup: json["isGroup"],
      lastSeen: Message.fromJson(json['lastSeen']),
      createdAt: DateTime.parse(json['createdAt']),
      participantId: List<String>.from(json['participantId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "isGroup": isGroup,
      "participantId": participantId,
      "lastSeen": lastSeen?.toString(),
      "createdAt": createdAt?.toIso8601String(),
    };
  }

  factory Chat.newChat(bool isGroup, List<String> participantsId) {
    return Chat(
      id: "0",
      isGroup: isGroup,
      createdAt: DateTime.now(),
      participantId: [...participantsId, ]
    );
  }
}
