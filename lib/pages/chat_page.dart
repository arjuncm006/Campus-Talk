import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../chat_services/chat_service.dart';
import '../components/my_text_filed.dart';
import '../firebase_auth/firebase_auth_service.dart';

class ChatPage extends StatelessWidget {
  final String NAME;
  final String receiverEmail;
  final String receiverID;
  final ChatService _chatService = ChatService();
  final FirebaseAuthService _authService = FirebaseAuthService();

  final TextEditingController _messageController = TextEditingController();

  ChatPage(
      {super.key,
      required this.NAME,
      required this.receiverEmail,
      required this.receiverID});

  // chat & auth services

// send message
  void sendMessage() async {
// if there is something inside the text field
    if (_messageController.text.isNotEmpty) {
// send the message
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NAME),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 10,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple[200]!,
                  Colors.deepPurple[200]!,
                  Colors.deepPurple[50]!,
                  Colors.deepPurple[100]!,
                ],
                stops: const [
                  0.1,
                  0.3,
                  0.9,
                  1.0
                ]
            )
        ),
        child: Column(

          children: [

            Expanded(
              child: _buildMessageList(),
            ),
            buildUserInput(),
          ],

        ),
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
// errors
          if (snapshot.hasError) {
            return const Text("Error");
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading .. ");
          }

          // return list view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          ); // ListView
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4, 4),
                      blurRadius: 10,
                    ),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.deepOrange[200]!,
                        Colors.deepOrange[200]!,
                        Colors.deepOrange[50]!,
                        Colors.deepOrange[100]!,
                      ],
                      stops: const [
                        0.1,
                        0.3,
                        0.9,
                        1.0
                      ])),
              child: Center(
                child: Text(
                  data["message"],
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildUserInput() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 10,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple[200]!,
                Colors.deepPurple[200]!,
                Colors.deepPurple[50]!,
                Colors.deepPurple[100]!,
              ],
              stops: const [
                0.1,
                0.3,
                0.9,
                1.0
              ]
          )
      ),
      child: Row(children: [
      // textfield should take up most of the space
        Expanded(
          child: Container(
            width: 5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 10,
                  ),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.deepPurple[200]!,
                      Colors.deepPurple[200]!,
                      Colors.deepPurple[50]!,
                      Colors.deepPurple[100]!,
                    ],
                    stops: const [
                      0.1,
                      0.3,
                      0.9,
                      1.0
                    ]
                )
            ),
            margin: EdgeInsets.all(15),
            child: TextField(

              cursorColor: Colors.black,
              controller: _messageController,



              style: TextStyle(
                  color: Colors.black,


              ),
              decoration: InputDecoration(

                hintStyle: TextStyle(color: Colors.black),
                hintText: "type the message ",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
          ),
        ),

      // send button
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                ),
              ],

          ),
          child: IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.arrow_upward)
            ,color: Colors.purple,
          ),
        ),
      ]),
    );
  }
}
