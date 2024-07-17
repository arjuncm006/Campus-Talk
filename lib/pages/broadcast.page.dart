import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Broadcast extends StatelessWidget {
  const Broadcast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: Container(
                width: 300,
                height: 50,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(42)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue[400]!,
                    offset: const Offset(0, 20),
                    blurRadius: 30,
                    spreadRadius: -5,
                  ),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blueAccent[100]!,
                      Colors.blueAccent[200]!,
                      Colors.blue[300]!,
                      Colors.blueAccent[100]!,
                    ],
                    stops: const [
                      0.1,
                      0.3,
                      0.9,
                      1.0
                    ])),
            child: Center(
              child: Text(
                "Broad Casting Station",
                style: TextStyle(

                  fontSize: 24.0,
                  color: Colors.white,

                  decorationColor: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
