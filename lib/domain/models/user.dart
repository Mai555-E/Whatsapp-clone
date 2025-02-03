class User {
  User(
      {this.lastSeen,
      required this.number,
      this.status,
      required this.id,
      required this.username,
      required this.createdAt,
      required this.profilePicture,
      this.contactsId = const [],
      this.groupId = const []});

  final DateTime? createdAt;
  final DateTime? lastSeen;
  final String id, username, number;
  final String? profilePicture, status;
  final List<String> groupId;
  final List<String> contactsId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        status: json["status"],
        number: json["number"],
        groupId: json["groupId"],
        lastSeen: json["lastSeen"],
        username: json["username"],
        createdAt: json["createdAt"],
        contactsId: List<String>.from(json["contactId"]) ,
        profilePicture: json["profilePicture"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "number": number,
      "status": status,
      "groupId": groupId,
      "lastSeen": lastSeen,
      "username": username,
      "createdAt": createdAt,
      "contactId": contactsId,
      "profilePicture": profilePicture,
    };
  }
}
