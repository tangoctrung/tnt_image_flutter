import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialtnt/model/item_chat.dart';
import 'package:socialtnt/widget/bottom_bar.dart';
import 'package:socialtnt/widget/item_chat.dart';

class ListChatScreen extends StatelessWidget {
  const ListChatScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 30,
          backgroundColor: Color.fromARGB(255, 250, 250, 250),
          leading: GestureDetector(
            onTap: (){Get.back();},
            child: const Icon(Icons.arrow_back_ios, size: 24, color: Color.fromARGB(255, 0, 0, 0)
            )
          ),
          title: const Text(
            "Liên lạc",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'TTNorm',
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            labelColor: Color.fromARGB(255, 0, 0, 0),
            indicatorColor: Color.fromARGB(255, 0, 0, 0),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(FontAwesomeIcons.solidMessage, size: 16), 
                    SizedBox(width: 10),
                    Text("Nhắn tin")
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(FontAwesomeIcons.display, size: 16), 
                    SizedBox(width: 10),
                    Text("Khám phá")
                  ],
                ),
              ),
            ],
            labelStyle: const TextStyle(
              fontFamily: 'TTNorm',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: TabBarView(
            children: [
              listConversation(),
              listUserChat(),
            ],
          ),
      ),
    );
  }


  Column listConversation() {
    return Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [               
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
      );
  }

  Column listUserChat() {
    return Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  
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
      );
  }
}