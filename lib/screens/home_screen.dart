import 'package:chat_app/data/models/chat_model.dart';
import 'package:chat_app/data/models/user.dart';
import 'package:chat_app/service/users_service.dart';
import 'package:chat_app/widgets/circular_material_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChatModel selectedChat;

  getChatUsers() {
    usersService.getUsers();
  }

  @override
  void initState() {
    super.initState();
    usersService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Selector<UsersService, bool>(
                selector: (context, usersService) =>
                    usersService.isGettingUsers,
                builder: (context, loading, _) {
                  return Selector<UsersService, List<User>>(
                      selector: (context, usersService) => usersService.users,
                      builder: (context, users, _) {
                        return CircularMaterialSpinner(
                          loading: loading,
                          child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                var user = users.toList()[index];
                                return GestureDetector(
                                  onTap: () {
                                    selectedChat = ChatModel(
                                        id: user.id,
                                        currentMessage: "hey",
                                        name: user.email,
                                        profilePhoto: "no photo",
                                        time: DateTime.now());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatScreen(
                                                selectedUser: selectedChat)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    height: 50,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Icon(Icons.person_outline),
                                        SizedBox(width: 10),
                                        Text("${user.email}")
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      });
                }),
          ),
          GestureDetector(
            onTap: getChatUsers,
            child: Container(
              height: 10,
              width: double.infinity,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
