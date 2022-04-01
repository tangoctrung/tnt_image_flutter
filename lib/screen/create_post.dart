import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialtnt/widget/bottom_bar.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Tạo bài viết",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'TTNorm',
                            ),
                          ),

                          Text(
                            "Chia sẻ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'TTNorm',
                              color: Color.fromARGB(255, 29, 95, 216),
                              decoration: TextDecoration.underline,
                            ),
                          ),

                        ],
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
                          if (imageFile != null)                      
                            Container(
                                width: MediaQuery.of(context).size.width*0.95,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: 
                                  Image(
                                    image: FileImage(imageFile!),
                                  ),
                              
                              )
                          else 
                            Container(
                                width: MediaQuery.of(context).size.width*0.95,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: Image(
                                  image: AssetImage('assets/images/bgLogin1.png'),
                                ),
                                                                                                   
                              ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) =>
                                      bottomChooseAvatar()),
                                );
                              },
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.fileArrowUp, size: 18),
                                  SizedBox(width: 5),
                                  Text('Chọn ảnh')
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 53, 53, 53)),
                              ),
                            ),
                          )
                        ],
                        
                      ),
                      
                    ]),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.06,
              //   decoration: const BoxDecoration(
              //       border: Border(
              //     top: BorderSide(
              //       color: Color.fromARGB(255, 194, 194, 194),
              //       width: 0.5,
              //     ),
              //   )),
              //   child: BottomBar(),
              // ),
            ],
          ),
        ),
      ),
    );
  }


  Widget bottomChooseAvatar() {
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
}
