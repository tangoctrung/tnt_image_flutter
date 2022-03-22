import 'package:flutter/material.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/item_post_image.dart';

class PostSavedScreen extends StatefulWidget {
  const PostSavedScreen({Key? key}) : super(key: key);

  @override
  State<PostSavedScreen> createState() => _PostSavedScreenState();
}

class _PostSavedScreenState extends State<PostSavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppBarWidget(
                  'Bài viết đã lưu', context, Color.fromARGB(255, 59, 59, 59)),
            ),
            Expanded(
              flex: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      postImageList.length > 0
                          ? Expanded(
                              flex: 10,
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 3,
                                    crossAxisSpacing: 3,
                                    crossAxisCount: 3,
                                  ),
                                  itemCount: postImageList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ItemImagePost(index);
                                  }),
                            )
                          : Column(children: const [
                              SizedBox(height: 20),
                              Text('Không tìm thấy bài viết nào',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 219, 8, 8),
                                  ))
                            ])
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
