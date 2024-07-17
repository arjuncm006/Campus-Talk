
import 'package:flutter/material.dart';

import '../chat_services/chat_service.dart';
import '../components/usertile.dart';
import '../firebase_auth/firebase_auth_service.dart';
import 'chat_page.dart';
import 'mydrawer.dart';


class List_of_stu extends StatelessWidget {
  List_of_stu({super.key});

  final ChatService _chatService = ChatService();
  final FirebaseAuthService _authService = FirebaseAuthService();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("CSE -B  Engineering")
      ),
      drawer:MyDrawer(),
      body: Container(child: _buildUserList(),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("ERROR");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading.. ");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),

        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {

    if( userData["email"] != _authService.getCurrentUser()!.email){
      return UserTile(

        text: userData["NAME"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  NAME: userData["NAME"],
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
              )
          );
        },

      );
    } else {
      return Container(

      );
    }



  }
}
