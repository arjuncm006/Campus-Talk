import 'package:clg_chat/models/home_conatiner.dart';
import 'package:clg_chat/pages/third_year.dart';
import 'package:flutter/material.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
      children: [
        const home_container(taxt: "1-Year"),
        const home_container(taxt: "2-Year"),

        GestureDetector(
          child: const home_container(taxt: "3-Year"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const third_year()),
            );
          },
        ),

        const home_container(taxt: "4-Year"),
        const home_container(taxt: "Teaching Staff"),
        const home_container(taxt: "Non Teaching Staff"),
      ],
    ));
  }
}
