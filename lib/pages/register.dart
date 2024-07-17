import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';

import '../components/my_text_filed.dart';
import '../components/toast.dart';
import '../firebase_auth/firebase_auth_service.dart';
import 'host_page.dart';
import 'login_page.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(

        children: [

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(
                    height: 100,
                  ),
                  const Icon(
                    Icons.login_sharp,
                    size: 80,
                    color: Color(0xff502f4c),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Be a part of our family",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff502f4c),
                    ),
                  ),
                  const Row(
                    children: [
                      Text("Sign up",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                      controller: _usernameController,
                      hintText: "user name",
                      obsecureText: false),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: SafeArea(
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                                controller: _emailController,
                                hintText: 'email',
                                obsecureText: false),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: MyTextField(
                                controller: _passwordController,
                                hintText: 'password',
                                obsecureText: false),
                          ),

                        ],


                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(onTap: () {
                    _signUp();
                  }, text: 'Create account'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('have an account?'),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login_Page()),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _signUp() async {

    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password, username);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const Host_page()),
      );
    } else {
      showToast(message: "Some error happend");
    }
  }
}