class User {
  User({
    this.status,
    this.lastSeen,
    required this.id,
    required this.name,
    required this.number,
    required this.createdAt,
    required this.profilePicture,
    this.groupId = const [],
    this.contactsId = const [],
  });

  final DateTime? lastSeen;
  final DateTime? createdAt;
  final List<String> groupId;
  final List<String> contactsId;
  final String id, name, number;
  final String? profilePicture, status;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      number: json["number"],
      groupId: json["groupId"],
      lastSeen: json["lastSeen"],
      createdAt: json["createdAt"],
      profilePicture: json["profilePicture"],
      contactsId: List<String>.from(json["contactId"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "number": number,
      "status": status,
      "groupId": groupId,
      "lastSeen": lastSeen,
      "createdAt": createdAt,
      "contactId": contactsId,
      "profilePicture": profilePicture,
    };
  }
}
