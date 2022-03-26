import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/screen/detail_post.dart';

class ItemImagePost extends StatelessWidget {
  final int index;
  ItemImagePost(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {Get.toNamed('/detailPost');},
        child: Image(
          image: AssetImage(postImageList[index].imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}