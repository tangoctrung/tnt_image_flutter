import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialtnt/config/url.dart';
import 'package:socialtnt/controller/chat_message_controller.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/model/item_message.dart';
// import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/app_bar_chat.dart';
// import 'package:socialtnt/widget/item_chat.dart';
import 'package:socialtnt/widget/item_message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({ Key? key }) : super(key: key);

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  ScrollController _scrollController = ScrollController();
  ChatMessageController chatMessageController = Get.put(ChatMessageController());
  GlobalController globalController = Get.put(GlobalController());
  bool focus = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;

  @override
  void initState() {
    socket = IO.io('http://192.168.220.1:8000/',
        IO.OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        //.disableAutoConnect()  // disable auto-connection
        .setExtraHeaders({'foo': 'bar'}) // optional
        .build());

    socket.onConnect((_) {
      print('connect');
      socket.emit('fromClient', 'test from client');
    });

    //When an event recieved from server, data is added to the stream
    socket.onDisconnect((_) => print('disconnect'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // resizeToAvoidBottomInset: false,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/bgChat.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            GestureDetector(           
              child: Obx(()=> 
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: itemAppBarChat(
                            username: chatMessageController.username.value, 
                            avatar: chatMessageController.avatar.value, 
                            context: context,
                          )
                          // child: AppBar(),
                        ),
                        
                        Expanded(
                          flex: 10,
                          child: GestureDetector(
                              onTap: () {FocusScope.of(context).unfocus();},
                            child: Container(
                              color: Colors.transparent,
                              child: ListView.builder(
                                itemCount: chatMessageController.listMessage.length,
                                controller: _scrollController,
                                itemBuilder: (BuildContext context, int index) {
                                  return itemMessage(index: index);
                                },),
                            ),
                          ),
                        ),
          
                      ],
                    ),    
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: InputWriteMessage(),
                      ),
                    ),                                  
                  ],
                ),
              )
            ),
          ] 
        ),
      ),
    );
  }


  // ignore: non_constant_identifier_names
  Widget InputWriteMessage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 212, 212, 212),
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
              child: Icon(FontAwesomeIcons.file)
            ),
          ),
          Expanded(
            flex: 5,
            child: TextField(
              controller: chatMessageController.txtInput,
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
            child: GestureDetector(
              onTap: () async {
                await chatMessageController.createMessage();
              },
              child: Icon(FontAwesomeIcons.paperPlane)
            )
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
                children: const [
                  Icon(FontAwesomeIcons.camera, size: 18),
                  SizedBox(width: 8,),
                  Text("Camera"),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 53, 53, 53)),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                takePhoto(source: ImageSource.gallery);
                Get.back();
              },
              child: Row(
                children: const [
                  Icon(FontAwesomeIcons.images, size: 18),
                  SizedBox(width: 8,),
                  Text("Thư viện"),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 53, 53, 53)),
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

  Align itemMessage({index}) {
    return Align(
      alignment: chatMessageController.listMessage[index]["senderId"] == globalController.user.value.id ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Card(
          elevation: 1,
          shadowColor: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          color: chatMessageController.listMessage[index]["senderId"] == globalController.user.value.id ? Color.fromARGB(255, 48, 132, 165) : Color.fromARGB(255, 240, 242, 243),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 15,
                  bottom: 15,
                ),
                child: Text(
                  chatMessageController.listMessage[index]["content"],
                  style: TextStyle(
                    fontSize: 16,
                    color: chatMessageController.listMessage[index]["senderId"] == globalController.user.value.id ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              // Positioned(
              //   bottom: 4,
              //   right: 15,
              //   child: Row(
              //     children: [
              //       Text(
              //         listMessage[index].time,
              //         style: TextStyle(
              //           fontSize: 13,
              //           color: listMessage[index].type ? Color.fromARGB(255, 165, 229, 248) : Color.fromARGB(255, 136, 135, 135),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 5,
              //       ),
              //       // if (listMessage[index].type)
              //       //   const Icon(
              //       //     Icons.done_all,
              //       //     size: 20,
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Container itemAppBarChat({username, avatar, context}) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(0, 252, 250, 250),
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromARGB(255, 158, 158, 158),
          )
        ),
      ),
      child: Row(
        
        children: [
          Container(
            child: IconButton(
              onPressed: () {Get.back();},
              icon: const Icon(Icons.arrow_back_ios_rounded, color: Color.fromARGB(255, 36, 36, 36),)
            )
          ),    
          SizedBox(width: 15),   
          (avatar != "") ?
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                width: 35,
                height: 35,
                image: NetworkImage(avatar),
                fit: BoxFit.cover,
              ),
            )
          :
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: const Image(
                width: 35,
                height: 35,
                image: AssetImage(URL.URL_AVATAR),
                fit: BoxFit.cover,
              ),
            ),
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 36, 36),
                ),
              ),             

            ]
          ),  
        ],
      )
    );
  }
}