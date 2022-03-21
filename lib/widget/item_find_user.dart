import 'package:flutter/material.dart';
import 'package:socialtnt/model/find_user.dart';

class FindUserWidget extends StatelessWidget {

  final int index;
  FindUserWidget(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {Navigator.pushNamed(context, 'profile');},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                width: 40,
                height: 40,
                image: AssetImage(listFindUser[index].avatar),
              ),
            ),
            Text(
              listFindUser[index].name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 59, 59, 59),
              )
            ),
          ],
        ),
      )
    );
  }
}