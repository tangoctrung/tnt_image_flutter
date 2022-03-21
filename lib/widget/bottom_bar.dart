
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int type = 1;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        decoration: BoxDecoration(
            border: type == 1
                ? const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 7, 105, 197),
                      width: 1,
                    ),
                  )
                : const Border(
                    top: BorderSide(
                      color: Color.fromARGB(0, 255, 255, 255),
                      width: 0,
                    ),
                  )),
        child: IconButton(
            onPressed: () {
              setState(() {
                type = 1;
              });
              Navigator.pushNamed(context, 'home');
            },
            icon: Icon(
              type == 1 ? Icons.home : Icons.home_outlined,
              color: type == 1
                  ? Color.fromARGB(255, 7, 105, 197)
                  : Color.fromARGB(255, 68, 68, 68),
            )),
      ),
      Container(
        decoration: BoxDecoration(
            border: type == 2
                ? const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 7, 105, 197),
                      width: 1,
                    ),
                  )
                : const Border(
                    top: BorderSide(
                      color: Color.fromARGB(0, 255, 255, 255),
                      width: 0.5,
                    ),
                  )),
        child: IconButton(
            onPressed: () {
              setState(() {
                type = 2;
              });
              Navigator.pushNamed(context, 'search');
            },
            icon: Icon(
              type == 2 ? Icons.search : Icons.search_outlined,
              color: type == 2
                  ? Color.fromARGB(255, 7, 105, 197)
                  : Color.fromARGB(255, 68, 68, 68),
            )),
      ),
      Container(
        decoration: BoxDecoration(
            border: type == 3
                ? const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 7, 105, 197),
                      width: 1,
                    ),
                  )
                : const Border(
                    top: BorderSide(
                      color: Color.fromARGB(0, 255, 255, 255),
                      width: 0.5,
                    ),
                  )),
        child: IconButton(
            onPressed: () {
              setState(() {
                type = 3;
              });
              Navigator.pushNamed(context, 'createPost');
            },
            icon: Icon(
              type == 3 ? Icons.add_a_photo : Icons.add_a_photo_outlined,
              color: type == 3
                  ? Color.fromARGB(255, 7, 105, 197)
                  : Color.fromARGB(255, 68, 68, 68),
            )),
      ),
      Container(
        decoration: BoxDecoration(
            border: type == 4
                ? const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 7, 105, 197),
                      width: 1,
                    ),
                  )
                : const Border(
                    top: BorderSide(
                      color: Color.fromARGB(0, 255, 255, 255),
                      width: 0.5,
                    ),
                  )),
        child: IconButton(
            onPressed: () {
              setState(() {
                type = 4;
              });
              Navigator.pushNamed(context, 'listChat');
            },
            icon: Icon(
              type == 4 ? Icons.message : Icons.message_outlined,
              color: type == 4
                  ? Color.fromARGB(255, 7, 105, 197)
                  : Color.fromARGB(255, 68, 68, 68),
            )),
      ),
      Container(
        decoration: BoxDecoration(
            border: type == 5
                ? const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 7, 105, 197),
                      width: 1,
                    ),
                  )
                : const Border(
                    top: BorderSide(
                      color: Color.fromARGB(0, 255, 255, 255),
                      width: 0.5,
                    ),
                  )),
        child: IconButton(
            onPressed: () {
              setState(() {
                type = 5;
              });
              Navigator.pushNamed(context, 'profile');
            },
            icon: Icon(
              type == 5 ? Icons.person : Icons.person_outlined,
              color: type == 5
                  ? Color.fromARGB(255, 7, 105, 197)
                  : Color.fromARGB(255, 68, 68, 68),
            )),
      ),
    ]);
  }
}
