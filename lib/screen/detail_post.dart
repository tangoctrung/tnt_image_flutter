import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialtnt/controller/detail_post_controller.dart';
import 'package:socialtnt/controller/globalController.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:photo_view/photo_view.dart';

class DetailPostScreen extends StatefulWidget {
  const DetailPostScreen({Key? key}) : super(key: key);

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  bool isShowDetail = false;
  DetailPostController dtPostController = Get.put(DetailPostController());
  GlobalController globalController = Get.put(GlobalController());
  PhotoViewController controller = PhotoViewController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PhotoView(
                  controller: controller,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2.8,
                  backgroundDecoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                  imageProvider: NetworkImage(dtPostController.postDetail["images"]),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  FontAwesomeIcons.angleLeft,
                  size: 28,
                  color: Color.fromARGB(255, 54, 54, 54),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width / 2 - 24,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isShowDetail = true;
                  });
                },
                icon: const Icon(
                  FontAwesomeIcons.angleUp,
                  size: 32,
                  color: Color.fromARGB(255, 80, 80, 80),
                ),
              ),
            ),
            
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              bottom: isShowDetail
                  ? 0
                  : -MediaQuery.of(context).size.height * 4 / 5,
              left: 0,
              right: 0,
              child: GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 4 / 5,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 242, 242, 242),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isShowDetail = false;
                            });
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.angleDown,
                                  size: 32,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image(
                                      image: NetworkImage(dtPostController
                                          .postDetail["authorId"]["avatar"]),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dtPostController.postDetail["authorId"]
                                          ["username"],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Quicksand',
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    const Text(
                                      // timeago.format(DateTime(dtPostController.postDetail["createdAt"])),
                                      "5 phut",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Quicksand',
                                        color:
                                            Color.fromARGB(255, 160, 160, 160),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Obx(() => 
                              GestureDetector(
                                // child: Icon(Icons.bookmark_outline),
                                onTap: () async {
                                  String postId = dtPostController.postDetail["_id"].toString();
                                  await dtPostController.saveOrUnsavePost(postId);
                                },
                                child: Icon(globalController.postSaved
                                        .contains(
                                            dtPostController.postDetail["_id"])
                                    ? FontAwesomeIcons.solidBookmark
                                    : FontAwesomeIcons.bookmark),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(dtPostController.postDetail["body"],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 78, 78, 78),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dtPostController
                                    .postDetail["themen"].length,
                                itemBuilder: (BuildContext context, index) =>
                                    Text(
                                        "#" +
                                            dtPostController
                                                .postDetail["themen"][index] +
                                            " ",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color:
                                              Color.fromARGB(255, 11, 116, 214),
                                        )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: Column(
                            children: [
                              Obx(()=> 
                                Row(children: [
                                  Text(
                                    dtPostController.listLikes.length
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () async {
                                      String postId = dtPostController.postDetail["_id"].toString();
                                      await dtPostController.likeOrUnlikePost(postId);
                                    },
                                    child: Icon(dtPostController
                                            .listLikes
                                            .contains(
                                                globalController.user.value.id)
                                        ? FontAwesomeIcons.solidHeart
                                        : FontAwesomeIcons.heart),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    dtPostController.listComment.length
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(FontAwesomeIcons.comment)
                                ]),
                              ),
                              SizedBox(height: 10),
                              const Text(
                                'Bình luận',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              InputWriteComment(dtPostController: dtPostController, postId: dtPostController.postDetail["_id"]),
                              SizedBox(height: 20),
                              Obx(() => 
                                dtPostController.listComment.length > 0 ?
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    // height: MediaQuery.of(context).size.height * 0.3,
                                    // color: Color.fromARGB(255, 65, 40, 40),
                                    child: Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              dtPostController.listComment.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return itemComment(
                                              comment: dtPostController
                                                  .listComment[index],
                                            );
                                          }),
                                    ),
                                  ),
                                )
                                : const Expanded(
                                  child: Center(
                                    child: Text(
                                      'Chưa có bình luận nào.',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 104, 55, 55),
                                        fontFamily: 'TTNorm',
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
          ]),
        ),
      ),
    );
  }

  Padding itemComment({comment}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image(
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                  image: NetworkImage(comment["writerId"]["avatar"]),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(comment["writerId"]["username"] + ": ",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                )),
            SizedBox(width: 8,),
            const Text('2 phut',
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 153, 153, 153),
            )),
              
              
            ]),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              comment["content"],
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 3,
                softWrap: true,
            ),
          ),
          // SizedBox(width: 5),
          // Expanded(
          //   flex: 2,
          //   child: Column(
          //     children: [
          //       GestureDetector(
          //         child: Icon(
          //           comment["likes"].contains(globalController.user.value.id)
          //               ? FontAwesomeIcons.solidHeart
          //               : FontAwesomeIcons.heart,
          //           size: 16,
          //         ),
          //       ),
          //       Text(comment["likes"].length.toString(),
          //           style: TextStyle(
          //             fontSize: 12,
          //           )),
          //     ],
          //   ),
          // ),
        ]),
      ),
    );
  }

  Row InputWriteComment({dtPostController, postId}) {
    return Row(
      children: [
        if (globalController.user.value.avatar != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image(
              height: 40,
              width: 40,
              fit: BoxFit.cover,
              image:
                  NetworkImage(globalController.user.value.avatar.toString()),
            ),
          )
        else
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: const Image(
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/avatars/1.jpg')),
          ),
        SizedBox(width: 5.0),
        Expanded(
          flex: 10,
          child: Container(
            child: TextField(
              controller: dtPostController.contentComment,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  hintText: 'Viết gì đó...'),
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 66, 66, 66),
                  height: 1.5),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {dtPostController.createComment(postId);},
            child: const Icon(
              FontAwesomeIcons.paperPlane,
            ),
          ),
        )
      ],
    );
  }
}
