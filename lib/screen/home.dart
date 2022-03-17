import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
         children: [
            Container(
              width: 200,
              height: 200,
              color: Color.fromARGB(255, 123, 234, 156),
            ),
            Container(
              width: 200,
              height: 200,
              color: Color.fromARGB(255, 27, 62, 175),
            ),
         ],
        ),
      ),
    );
  }
}