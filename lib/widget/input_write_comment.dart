import 'package:flutter/material.dart';

class InputWriteComment extends StatelessWidget {
  const InputWriteComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          width: 35,
          height: 35,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/avatars/1.jpg'),
        ),
        SizedBox(width: 5.0),
        Expanded(
          flex: 10,
          child:  Container(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                hintText: 'Viết gì đó...'
              ),
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 66, 66, 66),
                  height: 1.5),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            child: Icon(
              Icons.send,
            ),
          ),
        )
      ],
    );
  }
}
