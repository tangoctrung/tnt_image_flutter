import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/model/item_post.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/screen/list_post.dart';
import 'package:socialtnt/widget/bottom_bar.dart';
import 'package:socialtnt/widget/item_post.dart';
import 'package:socialtnt/widget/item_post_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const Text(
                    'Trang chủ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bài viết liên quan',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.48,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: <Widget>[
                            PageView.builder(
                              scrollDirection: Axis.horizontal,
                              // controller: _pageController,
                              // onPageChanged: _onPageChanged,
                              itemCount: postList.length,
                              itemBuilder: (ctx, i) => ItemPost(i),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Gợi ý',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {Get.to(ListPostScreen());},
                            child: const Text(
                              'Xem thêm',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 10, 119, 207),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GridView.custom(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          repeatPattern:
                              QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 2),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => ItemImagePost(index),
                          childCount: postImageList.length < 8 ? postImageList.length : 8,
                        ),
                      ),
                    ],
                  ),
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
}