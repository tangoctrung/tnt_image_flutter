import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/auth_controller.dart';
import 'package:socialtnt/controller/detail_post_controller.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/controller/info_user_other.dart';
import 'package:socialtnt/controller/user_controller.dart';

class InfoUserOtherScreen extends StatefulWidget {
  const InfoUserOtherScreen({Key? key}) : super(key: key);

  @override
  State<InfoUserOtherScreen> createState() => _InfoUserOtherScreenState();
}

class _InfoUserOtherScreenState extends State<InfoUserOtherScreen> {
  GlobalController globalController = Get.put(GlobalController());
  AuthController authController = Get.put(AuthController());
  UserController userController = Get.put(UserController());
  InfoUserOtherController infoUserOtherController = Get.put(InfoUserOtherController());


  @override
  Widget build(BuildContext context) {
    // infoUserOtherController.getUserId(Get.arguments);
    infoUserOtherController.getInfoUser();
    infoUserOtherController.getAllPost();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {Get.back();},
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Obx(() => 
            Text(
              infoUserOtherController.user.value.username ?? "Ẩn danh",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
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
                          Obx(() => 
                            Stack(children: [
                                !infoUserOtherController.user.value.avatar.toString().contains('http') ?
                                  Container(
                                    width: 120,
                                    height: 120,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/avatars/5.png'),
                                        fit: BoxFit.cover,
                                      ),                       
                                    ),                              
                                  ) : 
                                  Container(
                                    width: 120,
                                    height: 120,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      image: DecorationImage(
                                        image: NetworkImage(infoUserOtherController.user.value.avatar.toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),                              
                                  ),
                            ]),
                          ),
                          Obx(() => 
                            Text( infoUserOtherController.user.value.username.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                )),
                          ), 
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
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
                                    // globalController.onChangeTab(3);
                                    Get.back();
                                    Get.toNamed('/listChat');
                                  },
                                  child: Row(
                                    children: const [
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
                              ]),
                          SizedBox(height: 15),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => 
                                      infoUserOtherController.posts.value.length > 0
                                          ? Expanded(
                                              flex: 10,
                                              child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisSpacing: 3,
                                                    crossAxisSpacing: 3,
                                                    crossAxisCount: 3,
                                                  ),
                                                  itemCount: infoUserOtherController.posts.value.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Container(
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          await Get.put(DetailPostController()).getPostDetail(infoUserOtherController.posts[index].id);
                                                          await Get.put(DetailPostController()).getComments(infoUserOtherController.posts[index].id);
                                                          Get.toNamed('/detailPost');
                                                        },
                                                        child: Image(
                                                          image: NetworkImage(infoUserOtherController.posts.value[index].images!),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            )
                                          : Center(
                                            child: Column(children: const [
                                                SizedBox(height: 50),
                                                Text('Không có bài viết nào',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 24,
                                                      color: Color.fromARGB(
                                                          255, 219, 8, 8),
                                                    ))
                                              ]),
                                          ),
                                    ) 
                                        
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openModalViewProfile(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bd) {
          return Container(
            height: 320,
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
                    children: [
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
                        infoUserOtherController.user.value.username.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
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
                        infoUserOtherController.user.value.email.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
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
                        infoUserOtherController.user.value.date.toString() == '' ? 'Chưa có thông tin' : infoUserOtherController.user.value.date.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
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
                        infoUserOtherController.user.value.address.toString() == '' ? 'Chưa có thông tin' : infoUserOtherController.user.value.address.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
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
                        infoUserOtherController.user.value.job.toString() == '' ? 'Chưa có thông tin' : infoUserOtherController.user.value.job.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                    ],
                  ),                 
                ],
              ),
            ),
          );
        });
  }

}

