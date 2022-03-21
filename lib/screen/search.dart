import 'package:flutter/material.dart';
import 'package:socialtnt/model/find_user.dart';
import 'package:socialtnt/model/item_post_image.dart';
import 'package:socialtnt/widget/bottom_bar.dart';
import 'package:socialtnt/widget/item_find_user.dart';
import 'package:socialtnt/widget/item_post_image.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {FocusScope.of(context).unfocus();},
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tìm kiếm",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                                const Expanded(
                                  flex: 10,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                                      hintText: 'Tìm gì đó ở đây...',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 148, 148, 148),
                                          height: 1.5),
                                    ),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 46, 46, 46),
                                        height: 1.5),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                               
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color.fromARGB(255, 27, 81, 182),
                                    ),
                                    child: IconButton(
                                      onPressed: () {}, 
                                      icon: Icon(Icons.find_replace),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                )
          
                            ]
                          ),
                        ]
                      ),
                      SizedBox(height: 10,),
                      
                      Expanded(
                        child: Container(
                     
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Người dùng được tìm thấy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              listFindUser.length > 0 ?
                                Expanded(
                                  flex: 10,
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 3,
                                      crossAxisSpacing: 3,
                                      crossAxisCount: 4,
                                    ),
                                    itemCount: listFindUser.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return FindUserWidget(index);
                                    }
                                  ),
                                )
                                
                              : Column(
                                children: const [
                                  SizedBox(height: 20),
                                  Text(
                                    'Không tìm thấy người dùng nào',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 219, 8, 8),
                                    )
                                  )
                                ]
                              )
                            ]                       
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  'Bài viết được tìm thấy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              postImageList.length > 0 ?
                                Expanded(
                                  flex: 10,
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 3,
                                      crossAxisSpacing: 3,
                                      crossAxisCount: 4,
                                    ),
                                    itemCount: postImageList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return ItemImagePost(index);
                                    }
                                  ),
                                )
                                
                              : Column(
                                children: const [
                                  SizedBox(height: 20),
                                  Text(
                                    'Không tìm thấy bài viết nào',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 219, 8, 8),
                                    )
                                  )
                                ]
                              )
                            ]   
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 194, 194, 194),
                      width: 0.5,
                    ),
                  )),
                  child: BottomBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
