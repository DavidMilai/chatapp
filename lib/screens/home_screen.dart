import 'package:chat_app/data/models/chat_model.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChatModel selectedChat;

  List<ChatModel> users = [
    ChatModel(
        id: 1,
        currentMessage: "hey",
        name: "Milai",
        profilePhoto: "no photo",
        time: DateTime.now()),
    ChatModel(
        id: 2,
        currentMessage: "nothing",
        name: "David",
        profilePhoto: "no photo",
        time: DateTime.now()),
    ChatModel(
        id: 3,
        currentMessage: "hello",
        name: "Melvin",
        profilePhoto: "no photo",
        time: DateTime.now()),
    ChatModel(
        id: 4,
        currentMessage: "yow",
        name: "DMM",
        profilePhoto: "no photo",
        time: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var user = users[index];
                  return GestureDetector(
                    onTap: () {
                      selectedChat = user;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChatScreen(selectedUser: selectedChat)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 50,
                      color: Colors.red,
                      width: double.infinity,
                    ),
                  );
                }),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen())),
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
