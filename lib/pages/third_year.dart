import 'package:clg_chat/models/containe.dart';
import 'package:flutter/material.dart';

import 'mydrawer.dart';

class third_year extends StatefulWidget {
  const third_year({super.key});

  @override
  State<third_year> createState() => _third_yearState();
}

class _third_yearState extends State<third_year> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Year Engineering")
      ),
      drawer:MyDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
          myconatiner(taxt: 'CSE', value: 2,)
           ,
            myconatiner(taxt: 'I S', value: 1,),
            myconatiner(taxt: 'ECE', value: 1,),

        
          ],
        ),
      ),
    );
  }
}
