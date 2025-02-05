class Group {
  final String id, name;
  final DateTime createdAt;
  final DateTime? lastActivity;
  final List<String> adminsId, participantId;
  final String? lastMessage, image, description;

  Group({
    required this.id,
    required this.name,
    required this.image,
    required this.adminsId,
    required this.createdAt,
    required this.description,
    required this.lastMessage,
    required this.lastActivity,
    required this.participantId,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      lastMessage: json['lastMessage'],
      createdAt: DateTime.parse(json['createdAt']),
      adminsId: List<String>.from(json['adminsId']),
      lastActivity: DateTime.parse(json['lastActivity']),
      participantId: List<String>.from(json['participantId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'adminsId': adminsId,
      'lastMessage': lastMessage,
      'description': description,
      'participantId': participantId,
      'createdAt': createdAt.toIso8601String(),
      'lastActivity': lastActivity?.toIso8601String(),
    };
  }
}
