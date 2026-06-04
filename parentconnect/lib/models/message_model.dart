class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String contenu;
  final String createdAt;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.contenu,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      contenu: json['contenu'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'contenu': contenu,
      'created_at': createdAt,
    };
  }
}