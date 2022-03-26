
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:socialtnt/screen/home.dart';


Container bottomNavigator() {
  GlobalController globalController = Get.put(GlobalController());
  return Container(
    height: 50,
    width: double.infinity,
    // color: Colors.white,
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(
          width: 1.0,
          color: Color.fromARGB(255, 139, 137, 137),
        )
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      children: [

        Obx(() {
          return 
            Container(             
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      globalController.onChangeTab(0);
                    },
                    icon: Icon(
                      globalController.currentPage  == 0 ? Icons.home : Icons.home_outlined,
                      color: globalController.currentPage  == 0
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 68, 68, 68),
                    )
                  ),                  

                ],
              ),
            );

        }),

        Obx(() {
          return
            Container(             
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        globalController.onChangeTab(1);
                      },
                      icon: Icon(
                        globalController.currentPage  == 1 ? Icons.search : Icons.search_outlined,
                        color: globalController.currentPage  == 1
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 68, 68, 68),
                      )),                 
                ] 
              ),
            );

        }),
        
        Obx(() {
          return 
            Container(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                    globalController.onChangeTab(2);
                    },
                    icon: Icon(
                      globalController.currentPage  == 2 ? Icons.add_a_photo : Icons.add_a_photo_outlined,
                      color: globalController.currentPage  == 2
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 68, 68, 68),
                    )),               
                ]
              ),
            );

        }),
        
        Obx(() {
          return
            Container(
              child: Column(
                children : [
                  IconButton(
                      onPressed: () {
                        globalController.onChangeTab(3);
                      },
                      icon: Icon(
                        globalController.currentPage  == 3 ? Icons.message : Icons.message_outlined,
                        color: globalController.currentPage  == 3
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 68, 68, 68),
                      )),             
                ] 
              ),
            );

        }),
        
        Obx(() {
          return
            Container(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        globalController.onChangeTab(4);
                      },
                      icon: Icon(
                        globalController.currentPage  == 4 ? Icons.person : Icons.person_outlined,
                        color: globalController.currentPage  == 4
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 68, 68, 68),
                      )),               
                ]
              ),
            );

        }),
      
      ]),
  );
}
