

import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String? text;
  final void Function()? onTap;

  const UserTile({super.key,
  required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
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
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.person),

            const SizedBox(width: 20,),

            Text(text!),

          ],
        ),
      ),
    );
  }
}
