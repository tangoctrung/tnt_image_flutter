import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialtnt/model/item_message.dart';
// import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/app_bar_chat.dart';
// import 'package:socialtnt/widget/item_chat.dart';
import 'package:socialtnt/widget/item_message.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({ Key? key }) : super(key: key);

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  ScrollController _scrollController = ScrollController();
  bool focus = false;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "assets/images/bgChat.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            // resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: GestureDetector(           
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: AppBarChatWidget('Tạ Ngọc Trung', 'assets/images/avatars/1.jpg', 'Đang hoạt động', context,)
                          // child: AppBar(),
                        ),
                        
                        Expanded(
                          flex: 10,
                          child: GestureDetector(
                              onTap: () {FocusScope.of(context).unfocus();},
                            child: Container(
                              color: Colors.transparent,
                              child: ListView.builder(
                                itemCount: listMessage.length,
                                controller: _scrollController,
                                itemBuilder: (BuildContext context, int index) {
                                  return ItemMessageWidget(index);
                                },),
                            ),
                          ),
                        ),
    
                      ],
                    ),
                    
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: InputWriteMessage(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ] 
      ),
    );
  }


  // ignore: non_constant_identifier_names
  Widget InputWriteMessage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
        
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomChoosePhoto()),
                );
              },
              child: Icon(Icons.file_copy)
            ),
          ),
          Expanded(
            flex: 5,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                hintText: 'Viết gì đó...',
                
              ),
              focusNode: focusNode,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 66, 66, 66),
                  height: 1.5),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              minLines: 1,
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.send)
          ),
        ],
      ),
    );
  }

  Widget bottomChoosePhoto() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>  [
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton(
              onPressed: () {
                takePhoto(source: ImageSource.camera);
                Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.camera_enhance),
                  Text("Camera"),
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                takePhoto(source: ImageSource.gallery);
                Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.browse_gallery),
                  Text("Thư viện"),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto({required ImageSource source}) async {
    try {
      final file = await ImagePicker().pickImage(
          source: source,
          maxWidth: 640,
          maxHeight: 480,
          imageQuality: 70 //0 - 100
          );

      if (file?.path != null) {
        setState(() {
          imageFile = File(file!.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}