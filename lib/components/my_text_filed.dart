import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText ;
  final bool obsecureText;


   MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
  });

  bool isValidForm = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (inputValue){
        if(inputValue!.isEmpty){
          return "Please Fill before";
        }
        return null;
      },
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(

        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF9bf6ff),),
        ),
        fillColor:  const Color(0xFFc8b8db),
        filled: true,
        hintText: hintText,

        hintStyle: const TextStyle(color: Colors.white),

      )
      ,
    );
  }
}

















