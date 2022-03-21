import 'package:flutter/material.dart';
import 'package:socialtnt/widget/app_bar_chat.dart';

class ChatMessageScreen extends StatelessWidget {
  const ChatMessageScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppBarChatWidget('Tạ Ngọc Trung', 'assets/images/avatars/1.jpg', 'Đang hoạt động', context,)
            ),
            Expanded(
              flex: 10,
              child: Column(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Color.fromARGB(255, 123, 123, 123),
              ),
            ),
          ],
        ),
      ),
    );
  }
}