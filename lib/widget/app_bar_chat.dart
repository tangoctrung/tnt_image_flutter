import 'package:flutter/material.dart';

class AppBarChatWidget extends StatelessWidget {
  final String name;
  final String avatar;
  final String status;
  final BuildContext contextAction;
  // final Function back;
  AppBarChatWidget(this.name, this.avatar, this.status, this.contextAction);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 250, 250),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        
        children: [
          Container(
            child: IconButton(
              onPressed: () {Navigator.pop(contextAction);},
              icon: Icon(Icons.arrow_back_ios_rounded, color: Color.fromARGB(255, 36, 36, 36),)
            )
          ),    
          SizedBox(width: 15),   
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image(
              width: 35,
              height: 35,
              image: AssetImage(avatar),
            ),
          ),
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 36, 36),
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 122, 122),
                ),
              )

            ]
          ),  
        ],
      )
    );
  }
}