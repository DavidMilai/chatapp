import 'package:chat_app/data/models/chat_model.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/my_message.dart';
import 'package:chat_app/widgets/reply_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.selectedUser});

  final ChatModel selectedUser;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IO.Socket socket;
  late List<Message> messages = [];
  TextEditingController messageTextEditingController = TextEditingController();

  Future<void> connect() async {
    //socket = IO.io(Config.baseUrl, <String, dynamic>{
    socket = IO.io("http://192.168.100.30:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((data) {
      socket.on("message", (msg) {
        setMessage(type: "destination", message: msg["message"]);
      });
    });
    socket.emit("signin", widget.selectedUser.id);
  }

  void setMessage({required String type, required String message}) {
    Message newMessage = Message(message: message, type: type, userID: "test");
    setState(() {
      messages.add(newMessage);
    });
  }

  void sendMessage(
      {required String message, required int sourceId, required int targetId}) {
    if (messageTextEditingController.text.length != 0) {
      setMessage(type: "source", message: message);
      socket.emit("message", {
        "message": message,
        "sourceId": authService.authData.id,
        "targetId": targetId,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat person'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    if (message.type == "source")
                      return MyMessage(message: message.message, time: "time");
                    else
                      return ReplyMessage(
                        message: message.message,
                        time: 'time',
                      );
                  })),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: TextField(
                    controller: messageTextEditingController,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 55,
                height: 55,
                margin: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                child: IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    sendMessage(
                        message: messageTextEditingController.text,
                        sourceId: widget.selectedUser.id,
                        targetId: 10);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
