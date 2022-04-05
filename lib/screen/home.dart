import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/detail_post_controller.dart';
import 'package:socialtnt/controller/home_page_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {

  HomePageController hpController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    hpController.getPostsInvolve();
    hpController.getPostsDiscover();
    print(hpController.postsInvolve);
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
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TTNorm',
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
                      Obx(() =>
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
                                itemCount: hpController.postsInvolve.length,
                                itemBuilder: (BuildContext context, i) => itemPostHomaPage(context: context, index: i, hpController: hpController),
                              ),
                            ],
                          ),
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
                            onPressed: () {
                              
                              Get.toNamed('/listPost');
                            },
                            child: const Text(
                              'Xem thêm',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 10, 119, 207),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(() => 
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          child: GridView.custom(
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
                              (context, index) => itemPostImage(index: index, hpController: hpController),
                              childCount: hpController.postsDiscover.length < 8 ? hpController.postsDiscover.length : 8,
                            ),
                          ),
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

  Padding itemPostHomaPage({context, index, hpController}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await Get.put(DetailPostController()).getPostDetail(hpController.postsInvolve[index]["_id"].toString());
                await Get.put(DetailPostController()).getComments(hpController.postsInvolve[index]["_id"].toString());
                Get.toNamed('/detailPost');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.96,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: NetworkImage(hpController.postsInvolve[index]["images"]),
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
                            image: NetworkImage(hpController.postsInvolve[index]["authorId"]["avatar"]),
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hpController.postsInvolve[index]["authorId"]["username"],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const Text(
                            '2 phut',
                            style: TextStyle(
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

  Container itemPostImage({index, hpController}) {
    return Container(
      child: GestureDetector(
        onTap: () async {
          await Get.put(DetailPostController()).getPostDetail(hpController.postsDiscover[index]["_id"].toString());
          await Get.put(DetailPostController()).getComments(hpController.postsDiscover[index]["_id"].toString());
          Get.toNamed('/detailPost');
        },
        child: Image(
          image: NetworkImage(hpController.postsDiscover[index]["images"]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}