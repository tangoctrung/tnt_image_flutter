import 'package:flutter/material.dart';
import 'package:socialtnt/model/find_user.dart';

class UserFollowWidget extends StatelessWidget {

  final int index;
  UserFollowWidget(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {Navigator.pushNamed(context, 'profile');},
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                width: 40,
                height: 40,
                image: AssetImage(listFindUser[index].avatar),
              ),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listFindUser[index].name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 59, 59, 59),
                  )
                ),
                Text(
                  listFindUser[index].name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 158, 158, 158),
                  )
                ),
              ],
            
            ),
            SizedBox(height: 5),
          ],
        ),
      )
    );
  }
}