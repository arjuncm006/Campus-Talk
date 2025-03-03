import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const MyButton({super.key,
    required this.onTap,
    required this.text

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xFF502f4c),
          ),
          child: Center(
            child: Text(text,
              style: const TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold),),
          ),
        ));
  }
}