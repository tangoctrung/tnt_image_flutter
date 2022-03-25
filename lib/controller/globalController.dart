import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GlobalController extends GetxController {
  var db;


  late PageController pageController;
  RxInt currentPage = 0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: 0, keepPage: true);
  }

  void onChangeTab(int value) {
    try {
      currentPage.value = value;
      pageController.jumpToPage(value);
    } catch (e) {
      currentPage.value = value;
      pageController = PageController(initialPage: value, keepPage: true);
    }
  }


}
