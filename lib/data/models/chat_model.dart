class ChatModel {
  ChatModel({
    this.name,
    this.currentMessage,
    this.profilePhoto,
    this.time,
    this.id,
  });

  String? id;
  String? name;
  String? currentMessage;
  DateTime? time;
  String? profilePhoto;
}
