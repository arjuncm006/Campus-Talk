

import 'package:clg_chat/components/my_button.dart';
import 'package:clg_chat/components/my_text_filed.dart';
import 'package:clg_chat/components/square_tile.dart';
import 'package:clg_chat/components/toast.dart';
import 'package:clg_chat/firebase_auth/firebase_auth_service.dart';
import 'package:clg_chat/pages/host_page.dart';
import 'package:clg_chat/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';





class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

 // void login() async {
   // await FirebaseAuth.instance.signInWithEmailAndPassword(
     //   email: emailController.text, password: passwordController.text);
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFfffffc),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    const Icon(
                      Icons.mark_chat_read_rounded,
                      size: 80,
                      color: Color(0xff502f4c),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Buddy where were u..these days ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                        controller: emailController,
                        hintText: 'email',
                        obsecureText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        controller: passwordController,
                        hintText: 'pasword',
                        obsecureText: true),
                    const SizedBox(
                      height: 25,
                    ),
                    MyButton(
                        onTap: () {
                          login();
                        },
                        text: "Log in"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not a member?'),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const register()),
                            );
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            )),
                        const Text("Or continue with"),
                        Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            )),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        SquareTile(imagePath: 'lib/images/google.png'),

                        SizedBox(width: 25),

                        // apple button
                        SquareTile(imagePath: 'lib/images/apple.png')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void login() async {
    setState(() {
      _isSigning = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const Host_page()),
      );

    } else {
      showToast(message: "some error occured");
    }
  }
}

