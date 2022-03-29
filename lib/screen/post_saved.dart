import 'package:flutter/material.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/item_post_saved.dart';

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
                              child: ListView.builder(                                 
                                  itemCount: postImageList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ItemPostSaved(index);
                                  }),
                            )
                          : Center(
                            child: Column(children: const [
                                SizedBox(height: 100),
                                Text('Không tìm thấy bài viết nào',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 219, 8, 8),
                                    ))
                              ]),
                          )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
