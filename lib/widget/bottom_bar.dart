
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Container bottomNavigator() {
  GlobalController globalController = Get.put(GlobalController());
  return Container(
    height: 55,
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
            GestureDetector(
              onTap: () {globalController.onChangeTab(0);},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      globalController.currentPage  == 0 ? FontAwesomeIcons.house : FontAwesomeIcons.house,
                      color: globalController.currentPage  == 0
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 61, 60, 60),   
                      size: 20,            
                  ), 
                  SizedBox(height: 3), 
                  // Text(
                  //   'Khám phá',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'TTNorm',
                  //     fontWeight: FontWeight.w600,
                  //     color: globalController.currentPage  == 0
                  //         ? Color.fromARGB(255, 236, 116, 36)
                  //         : Color.fromARGB(255, 68, 68, 68), 
                  //   ),
                  // ),                
            
                ],
              ),
            );

        }),

        Obx(() {
          return
            GestureDetector(
              onTap: () {globalController.onChangeTab(1);},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      globalController.currentPage  == 1 ? FontAwesomeIcons.magnifyingGlass : FontAwesomeIcons.magnifyingGlass,
                      color: globalController.currentPage  == 1
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 61, 60, 60),   
                      size: 20,            
                  ), 
                  SizedBox(height: 3), 
                  // Text(
                  //   'Tìm kiếm',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'TTNorm',
                  //     fontWeight: FontWeight.w600,
                  //     color: globalController.currentPage  == 1
                  //         ? Color.fromARGB(255, 236, 116, 36)
                  //         : Color.fromARGB(255, 68, 68, 68), 
                  //   ),
                  // ),                
            
                ],
              ),
            );

        }),
        
        Obx(() {
          return 
            GestureDetector(
              onTap: () {globalController.onChangeTab(2);},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      globalController.currentPage  == 2 ? FontAwesomeIcons.plus : FontAwesomeIcons.plus,
                      color: globalController.currentPage  == 2
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 61, 60, 60),
                    size: 40,
                    ),                               
                ]
              ),
            );

        }),
        
        Obx(() {
          return
            GestureDetector(
              onTap: () {globalController.onChangeTab(3);},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      globalController.currentPage  == 3 ? FontAwesomeIcons.envelopeCircleCheck : FontAwesomeIcons.envelopeCircleCheck,
                      color: globalController.currentPage  == 3
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 61, 60, 60),    
                      size: 20,           
                  ), 
                  SizedBox(height: 3), 
                  // Text(
                  //   'Liên lạc',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'TTNorm',
                  //     fontWeight: FontWeight.w600,
                  //     color: globalController.currentPage  == 3
                  //         ? Color.fromARGB(255, 236, 116, 36)
                  //         : Color.fromARGB(255, 68, 68, 68), 
                  //   ),
                  // ),                
            
                ],
              ),
            );

        }),
        
        Obx(() {
          return
            GestureDetector(
              onTap: () {globalController.onChangeTab(4);},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      globalController.currentPage  == 4 ? FontAwesomeIcons.solidUser : FontAwesomeIcons.solidUser,
                      color: globalController.currentPage == 4
                          ? Color.fromARGB(255, 236, 116, 36)
                          : Color.fromARGB(255, 61, 60, 60),  
                      size: 20,             
                  ), 
                  SizedBox(height: 3), 
                  // Text(
                  //   'Cá nhân',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'TTNorm',
                  //     fontWeight: FontWeight.w600,
                  //     color: globalController.currentPage == 4
                  //         ? Color.fromARGB(255, 236, 116, 36)
                  //         : Color.fromARGB(255, 68, 68, 68), 
                  //   ),
                  // ),                
            
                ],
              ),
            );


        }),
      
      ]),
  );
}
