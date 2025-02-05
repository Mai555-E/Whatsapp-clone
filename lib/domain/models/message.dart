class Message {
  final DateTime timeStamp;
  Map<String, bool>? messageContent;
  final String? mediaUrl, messageType;
  final String senderId, chatId, content, id;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timeStamp,
    required this.chatId,
    this.mediaUrl,
    this.messageType,
    this.messageContent,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json['id'],
        senderId: json['senderId'],
        content: json['content'],
        timeStamp: DateTime.parse(json['timeStamp']),
        chatId: json['chatId'],
        mediaUrl: json['mediaUrl'],
        messageType: json['messageType'],
        messageContent: Map<String, bool>.from(json['messageContent']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "senderId": senderId,
      "content": content,
      "chatId": chatId,
      "mediaUrl": mediaUrl,
      "messageType": messageType,
      "messageContent": messageContent.toString(),
      "timeStamp": timeStamp,
    };
  }
}
