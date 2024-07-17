import 'package:flutter/material.dart';

class home_container extends StatelessWidget {
  final String taxt;
  const home_container({super.key, required this.taxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(42)),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple[400]!,
              offset: const Offset(0, 20),
              blurRadius: 30,
              spreadRadius: -5,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple[200]!,
                Colors.deepPurple[300]!,
                Colors.deepPurple[500]!,
                Colors.deepPurple[500]!,
              ],
              stops: const [
                0.1,
                0.3,
                0.9,
                1.0
              ])
      ),

      child: Row(
        children: [
          Icon(Icons.group, size: 40, color: Colors.grey[100]),
          const SizedBox(width: 20,),
          Text(taxt)
        ],
      ),
    );
  }
}
