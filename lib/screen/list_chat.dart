import 'package:flutter/material.dart';
import 'package:socialtnt/model/item_chat.dart';
import 'package:socialtnt/widget/bottom_bar.dart';
import 'package:socialtnt/widget/item_chat.dart';

class ListChatScreen extends StatelessWidget {
  const ListChatScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Nhắn tin',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'TTNorm',
                          )
                        ),
                      ]
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: ListView.builder(
                      itemCount: listChat.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemChatWidget(index);
                      },
                    ),
                  ),

                ]
              ),
            ),
          ),
          // Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height * 0.06,
          //     decoration: const BoxDecoration(
          //         border: Border(
          //       top: BorderSide(
          //         color: Color.fromARGB(255, 194, 194, 194),
          //         width: 0.5,
          //       ),
          //     )),
          //     child: BottomBar(),
          //   ),
        ],
      ),
    );
  }
}