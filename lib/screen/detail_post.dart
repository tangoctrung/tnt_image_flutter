import 'package:flutter/material.dart';
import 'package:socialtnt/model/comment.dart';
import 'package:socialtnt/widget/input_write_comment.dart';
import 'package:socialtnt/widget/item_comment.dart';

class DetailPostScreen extends StatefulWidget {
  const DetailPostScreen({Key? key}) : super(key: key);

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  bool isShowDetail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Stack(children: [
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GestureDetector(
                child: Image(
                  image: AssetImage('assets/images/bgMoblie/1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 24,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width / 2 - 24,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isShowDetail = true;
                });
              },
              icon: Icon(
                Icons.keyboard_arrow_up,
                size: 32,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom:
                isShowDetail ? 0 : -MediaQuery.of(context).size.height * 4 / 5,
            left: 0,
            right: 0,
            child: GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 4 / 5,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowDetail = false;
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 32,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/avatars/1.jpg'),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Tạ Ngọc Trung',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Quicksand',
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '5 phút trước',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Quicksand',
                                      color: Color.fromARGB(255, 160, 160, 160),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            child: Icon(Icons.bookmark_outline),
                          ),
                          
                          
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RémiRousselet Can you bit help me to understand what exactly it requires to rewrite to change that underline color to something else. Because Ive also stuck in the same kind of situation. Here is my post link',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 78, 78, 78),
                                )
                              ),
                              Text(
                                '#thiennhien',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 11, 116, 214),
                                )
                              ),
                            ],
                          ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children:  [
                                const Text('20',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                child: Icon(Icons.heart_broken),
                                ),
                                SizedBox(width: 20),
                                const Text('5',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.comment)
                              ]
                      
                            ),
                            SizedBox(height: 10),
                            const Text(
                              'Bình luận',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            InputWriteComment(),
                            SizedBox(height: 20),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height * 0.3,
                                // color: Color.fromARGB(255, 65, 40, 40),
                                child: Expanded(
                                  child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: listComment.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemCommentWidget(index);
                              }
                            ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
