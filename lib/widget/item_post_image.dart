import 'package:flutter/material.dart';
import 'package:socialtnt/model/item_post_image.dart';

class ItemImagePost extends StatelessWidget {
  final int index;
  ItemImagePost(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {Navigator.pushNamed(context, 'detailPost');},
        child: Image(
          image: AssetImage(postImageList[index].imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}