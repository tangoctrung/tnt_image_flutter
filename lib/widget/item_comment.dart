import 'package:flutter/material.dart';
import 'package:socialtnt/model/comment.dart';

class ItemCommentWidget extends StatelessWidget {
  
  final int index;

  ItemCommentWidget(this.index);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(     
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: Container(               
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image(
                      width: 35,
                      height: 35,
                      image: AssetImage(listComment[index].image),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listComment[index].name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    )
                  ),
                  Text(
                    listComment[index].content,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                    )
                  ),
                  Text(
                    listComment[index].time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 153, 153, 153),
                    )
                  ),
                ]
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.heart_broken,
                      size: 14,
                      ),
                  ),
                  Text(
                    listComment[index].totalLike.toString(),
                    style: TextStyle(
                      fontSize: 12,
                    )
                  ),
                ],
              ),
            ),
          ] 
      
        ),
      ),
    );
  }
}