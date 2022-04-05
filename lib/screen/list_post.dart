import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/detail_post_controller.dart';
import 'package:socialtnt/controller/home_page_controller.dart';
import 'package:socialtnt/widget/app_bar.dart';

class ListPostScreen extends StatefulWidget {
  @override
  State<ListPostScreen> createState() => _ListPostScreenState();
}

class _ListPostScreenState extends State<ListPostScreen> {
  // const ListPostScreen({Key? key}) : super(key: key);

  HomePageController hpController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController()).getPostsDiscover();
    // print(Get.put(HomePageController()).postsDiscover.length);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: AppBarWidget(
                    'Khám phá', context, Color.fromARGB(255, 68, 60, 60)),
              ),
              Expanded(
                flex: 26,
                child: GridView.custom(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => itemPostImage(index: index),
                    childCount:
                        Get.put(HomePageController()).postsDiscover.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container itemPostImage({index}) {
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
