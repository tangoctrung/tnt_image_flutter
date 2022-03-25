import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialtnt/model/find_user.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/screen/list_chat.dart';
import 'package:socialtnt/screen/post_saved.dart';
import 'package:socialtnt/widget/bottom_bar.dart';
import 'package:socialtnt/widget/item_find_user.dart';
import 'package:socialtnt/widget/item_post_image.dart';
import 'package:socialtnt/widget/item_user_follow.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _openModalSettingAdvanced(context);
                                },
                                child: Icon(Icons.settings),
                              ),
                            ]),
                        Stack(children: [
                          if (imageFile != null)
                            Container(
                              width: 120,
                              height: 120,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: FileImage(imageFile!),
                                    fit: BoxFit.cover),
                                
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            )
                          else
                            Container(
                              width: 120,
                              height: 120,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: AssetImage('./assets/images/avatars/1.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100.0),
                              ),                              
                            ),
                          Positioned(
                              bottom: 0,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) =>
                                        bottomChooseAvatar()),
                                  );
                                },
                                child: Icon(
                                  Icons.camera,
                                  color: Color.fromARGB(255, 112, 114, 114),
                                ),
                              )),
                        ]),
                        Text('Tạ Ngọc Trung',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.follow_the_signs),
                                    SizedBox(width: 5),
                                    Text(
                                      'Theo dõi',
                                    )
                                  ],
                                )),
                            SizedBox(width: 10),
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(ListChatScreen());
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.messenger),
                                    SizedBox(width: 5),
                                    Text(
                                      'Nhắn tin',
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _openModalViewProfile(context);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.info),
                                      Text('Thông tin')
                                    ],
                                  )),
                              SizedBox(width: 10),
                              ElevatedButton(
                                  onPressed: () {
                                    _showModalEditProfile(context);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      Text('Chỉnh sửa')
                                    ],
                                  )),
                            ]),
                        SizedBox(height: 15),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  postImageList.length > 0
                                      ? Expanded(
                                          flex: 10,
                                          child: GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 3,
                                                crossAxisSpacing: 3,
                                                crossAxisCount: 3,
                                              ),
                                              itemCount: postImageList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ItemImagePost(index);
                                              }),
                                        )
                                      : Column(children: const [
                                          SizedBox(height: 20),
                                          Text('Không tìm thấy bài viết nào',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                                color: Color.fromARGB(
                                                    255, 219, 8, 8),
                                              ))
                                        ])
                                ]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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

void _openModalSettingAdvanced(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bd) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              const Text(
            "Tùy chọn",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {   
                  Get.back();           
                  Get.to(PostSavedScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.storage),
                    SizedBox(width: 5),
                    Text("Lưu trữ"),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {               
                  Get.back();
                   _showModalChangePassword(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.lock_open),
                    SizedBox(width: 5),
                    Text("Đổi mật khẩu"),
                  ],
                ),
              ),
            ),
          ])
            ],
          ),
        );
      });
}

void _openModalViewProfile(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bd) {
        return Container(
          height: 350,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: 15),
                const Text(
                  'Xem thông tin',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: const [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text(
                      'Tên: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 46, 46, 46),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Tạ Ngọc Trung',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.email),
                    SizedBox(width: 5),
                    Text(
                      'Email: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 46, 46, 46),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'trung@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.date_range),
                    SizedBox(width: 5),
                    Text(
                      'Ngày sinh: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 46, 46, 46),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '23/07/2001',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.local_activity),
                    SizedBox(width: 5),
                    Text(
                      'Đến từ: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 46, 46, 46),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Kim Bảng, Hà Nam',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.work),
                    SizedBox(width: 5),
                    Text(
                      'Công việc: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 46, 46, 46),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sinh viên UET',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                          _showModalFollow(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 61, 58, 58)),
                        ),
                        child: Row(children: const [
                          Icon(Icons.person_add_alt_1),
                          SizedBox(width: 5),
                          Text('25'),
                          SizedBox(width: 30),
                          Icon(Icons.person_add_alt),
                          SizedBox(width: 5),
                          Text('5'),
                        ]))
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

void _showModalEditProfile(context) {
  showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('Chỉnh sửa thông tin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 15),
            Row(
              children: const [
                Icon(Icons.person),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        hintText: 'Tạ Ngọc Trung'),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 66, 66, 66),
                        height: 1.5),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: const [
                Icon(Icons.date_range),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        hintText: '23/07/2001'),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 66, 66, 66),
                        height: 1.5),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: const [
                Icon(Icons.local_activity),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        hintText: 'Kim Bảng, Hà Nam'),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 66, 66, 66),
                        height: 1.5),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: const [
                Icon(Icons.work),
                SizedBox(width: 5),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        hintText: 'Sinh viên UET'),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 66, 66, 66),
                        height: 1.5),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.update),
                  SizedBox(width: 5),
                  Text('Lưu lại')
                ],
              ),
            )
          ]),
        );
      });
}

void _showModalChangePassword(context) {
  showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text('Đổi mật khẩu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 15),
            Row(
              children: const [
                Icon(Icons.lock),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        hintText: 'Mật khẩu cũ'),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 66, 66, 66),
                        height: 1.5),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: const [
                Icon(Icons.password),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        hintText: 'Mật khẩu mới'),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 66, 66, 66),
                        height: 1.5),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: const [
                Icon(Icons.password),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        hintText: 'Nhập lại mật khẩu mới'),
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 66, 66, 66),
                        height: 1.5),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.update),
                  SizedBox(width: 5),
                  Text('Lưu lại')
                ],
              ),
            )
          ]),
        );
      });
}

void _showModalFollow(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bd) {
        return Column(children: [
          SizedBox(height: 10),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Người theo dõi (20)',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Expanded(
                                flex: 10,
                                child: ListView.builder(
                                    itemCount: listFindUser.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return UserFollowWidget(index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Đang theo dõi (12)',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Expanded(
                                flex: 9,
                                child: ListView.builder(
                                    itemCount: listFindUser.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return UserFollowWidget(index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ]);
      });
}
