import 'package:flutter/material.dart';

class inconatiner extends StatelessWidget {
  final String taxt;
  const inconatiner({super.key, required this.taxt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 80,
        height: 70,
        decoration: BoxDecoration(
            borderRadius:
            const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.deepOrange[400]!,
                offset: const Offset(0, 20),
                blurRadius: 30,
                spreadRadius: -5,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepOrange[200]!,
                  Colors.deepOrange[300]!,
                  Colors.deepOrange[500]!,
                  Colors.deepOrange[500]!,
                ],
                stops: const [
                  0.1,
                  0.3,
                  0.9,
                  1.0
                ]
            )
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Icon(Icons.person,
                size: 18, color: Colors.grey[100]),
            Text(taxt),
          ],
        ),
      ),

    );
  }
}
