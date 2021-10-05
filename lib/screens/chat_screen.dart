import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IO.Socket socket;
  TextEditingController messageTextEditingController = TextEditingController();

  Future<void> connect() async {
    socket = IO.io("http://192.168.100.6:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((data) => print("connected"));
    socket.emit("/test", "hello world");
  }

  sendMessage() {
    if (messageTextEditingController.text.length != 0) {
      print("hello");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: TextField(
                    controller: messageTextEditingController,
                    decoration: InputDecoration(
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
                  onPressed: sendMessage,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
