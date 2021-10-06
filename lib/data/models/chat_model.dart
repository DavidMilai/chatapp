class ChatModel {
  ChatModel({
    required this.name,
    required this.currentMessage,
    required this.profilePhoto,
    required this.time,
    required this.id,
  });

  int id;
  String name;
  String currentMessage;
  DateTime time;
  String profilePhoto;
}
