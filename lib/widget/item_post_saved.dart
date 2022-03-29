import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/screen/detail_post.dart';

class ItemPostSaved extends StatelessWidget {
  final int index;
  ItemPostSaved(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {Get.toNamed('/detailPost');},
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(postImageList[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Tạ Ngọc Trung',
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 18, 
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'TTNorm',
                                ),
                              ), 
                              Text(
                                '5 giờ',
                                style: TextStyle(
                                  fontSize: 14, 
                                  fontFamily: 'TTNorm',
                                  color: Color.fromARGB(255, 117, 117, 117),
                                ),
                              )
                            ]
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.bookmark)
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: 5,),
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Một hành trình đã khép lại với quá nhiều điều để tự hào cho ĐT Việt Nam. Ngoài những màn trình diễn',
                      
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ]
              ),
            ),
          ),

        ]
      ),
    );
  }
}