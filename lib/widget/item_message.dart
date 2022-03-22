import 'package:flutter/material.dart';
import 'package:socialtnt/model/item_message.dart';

class ItemMessageWidget extends StatelessWidget {

  final int index;
  ItemMessageWidget(this.index);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: listMessage[index].type ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Card(
          elevation: 1,
          shadowColor: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          color: listMessage[index].type ? Color.fromARGB(255, 48, 132, 165) : Color.fromARGB(255, 240, 242, 243),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 40,
                  top: 8,
                  bottom: 20,
                ),
                child: Text(
                  listMessage[index].content,
                  style: TextStyle(
                    fontSize: 16,
                    color: listMessage[index].type ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 15,
                child: Row(
                  children: [
                    Text(
                      listMessage[index].time,
                      style: TextStyle(
                        fontSize: 13,
                        color: listMessage[index].type ? Color.fromARGB(255, 165, 229, 248) : Color.fromARGB(255, 136, 135, 135),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    // if (listMessage[index].type)
                    //   const Icon(
                    //     Icons.done_all,
                    //     size: 20,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}