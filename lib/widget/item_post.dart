import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/screen/detail_post.dart';
import '../model/item_post.dart';

class ItemPost extends StatelessWidget {
  final int index;
  ItemPost(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {Get.to(DetailPostScreen());},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.96,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: AssetImage(postList[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: GestureDetector(                 
                  onTap: () {print('123');},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image(
                            image: AssetImage(postList[index].avatar),
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            postList[index].name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            postList[index].time,
                            style: const TextStyle(
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
                )),
          ],
        ),
      ),
    );
  }
}
