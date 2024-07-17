import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class GetUserNames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('tjit_3_cse_b');

    return FutureBuilder<QuerySnapshot>(
      future: users.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: GestureDetector(child: Text(" Name: ${data['NAME']} "
                ),onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          NAME: data["Name"],
                          receiverEmail: data["email"],
                          receiverID: data["uid"],
                        ),
                      )
                  );
                },
                ),
              );
            }).toList(),
          );
        }

        return Center(
          child: Container(
            child: Text("loading "),
          ),
        );
      },
    );
  }
}