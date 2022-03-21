import 'package:flutter/material.dart';
import 'package:socialtnt/model/item_chat.dart';

class ItemChatWidget extends StatelessWidget {
  final int index;
  ItemChatWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {Navigator.pushNamed(context, 'chatMessage');},
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                width: 50,
                height: 50,
                image: AssetImage(listChat[index].avatar)
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(              
                    listChat[index].name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: listChat[index].content + '    ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 54, 54, 54),
                            )
                          ),
                          
                          TextSpan(
                            text: listChat[index].time,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 141, 141, 141),
                                ),
                          ),
                        ]),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}