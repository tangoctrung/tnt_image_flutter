import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/item_post_image.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    (context, index) => ItemImagePost(index),
                    childCount:
                        postImageList.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
