import 'package:clg_chat/models/INcONATINER.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/list_of_stu.dart';

class myconatiner extends StatelessWidget {
  final String taxt;
  final num value;
  const myconatiner({super.key, required this.taxt, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 10,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Container(
          child: Row(
            children: [
              Container(
                width: 70,
                height: 200.0,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
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
                alignment: Alignment.center,
                child: Text(
                  taxt,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 92,
                      ),
                      if (value == 1)
                        const inconatiner(taxt: 'SEC-A',)

                      else if (value == 2) ...[
                        GestureDetector(child: const inconatiner(taxt: 'SEC-A'),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(child: const inconatiner(taxt: 'SEC-B'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => List_of_stu()),
                            );
                          },
                        ),

                      ]else if (value == 3) ...[
                        const inconatiner(taxt: 'SEC-A'),
                        const inconatiner(taxt: 'SEC-B'),
                        const inconatiner(taxt: 'SEC-C'),

                      ]

                      else ...[
                        // Your widget3 here
                      ],
                      const SizedBox(
                        width: 4,
                      ),

                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
