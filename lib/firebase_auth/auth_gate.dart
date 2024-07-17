
import 'package:clg_chat/pages/host_page.dart';
import 'package:clg_chat/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
        if(snapshot.hasData){
          return const Host_page();
        }
        else {
          return const Login_Page();
        }
        },
        
      ),
    );
  }
}
