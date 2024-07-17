import 'package:flutter/material.dart';

import '../firebase_auth/firebase_auth_service.dart';
import 'login_page.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({super.key});
  final FirebaseAuthService _auth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(

              child: Center(
                  child: Icon(
                    Icons.message,
                    color:Theme.of(context).colorScheme.primary,
                    size: 40,

                  )
              )
          ),
          ButtonBar(children: [
            GestureDetector(child: const Icon(Icons.logout),
              onTap: (){
                _auth.SignOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const Login_Page()),
                );
              }
              ,
            )
          ],),
          const Padding(padding: EdgeInsets.only(left: 25.0),
          child: ListTile(
            title: Text("H O M E"),
            leading: Icon(Icons.home),
          ),
          )
        ],
      ),
    );
  }
}
