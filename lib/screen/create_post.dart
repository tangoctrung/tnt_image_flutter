import 'package:flutter/material.dart';
import 'package:socialtnt/widget/bottom_bar.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {FocusScope.of(context).unfocus();},
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tạo bài viết",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              hintText: 'Suy nghĩ của bạn...',
                            ),
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 94, 93, 93),
                                height: 1.5),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5),
                        SizedBox(height: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.95,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: Image(
                                  image:
                                      AssetImage('assets/images/bgLogin1.png'),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload),
                                    Text('Chọn ảnh')
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
                          child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15)),
                          ),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.create),
                              SizedBox(width: 5),
                              Text('Chia sẻ')
                            ]
                          ),
                          ),
                        ),
                        
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 194, 194, 194),
                      width: 0.5,
                    ),
                  )),
                  child: BottomBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
