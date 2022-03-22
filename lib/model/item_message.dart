class ItemMessageModel {
  final String content;
  final String image;
  final String time;
  final bool type;

  ItemMessageModel({
    required this.content, 
    required this.image,
    required this.time,
    required this.type,
  });
}

final listMessage = [
  ItemMessageModel(
    content: 'Hello!',
    image: 'assets/images/bgLogin.jpg',
    time: '8:02pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Bạn là ai thế?',
    image: 'assets/images/bgLogin.jpg',
    time: '8:02pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Xin chào, bạn là ai, Xin chào, bạn là ai Xin chào, bạn là ai Xin chào, bạn là ai',
    image: 'assets/images/bgRegister.jpg',
    time: '8:03pm',
    type: false,
  ),
  ItemMessageModel(
    content: 'I am Trung',
    image: 'assets/images/bgLogin.jpg',
    time: '8:05pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Rất vui được làm quen với bạn, Rất vui được làm quen với bạn, Rất vui được làm quen với bạn',
    image: 'assets/images/bgRegister.jpg',
    time: '8:05pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Oh, tôi cũng vậy',
    image: 'assets/images/bgLogin.jpg',
    time: '8:06pm',
    type: false,
  ),
  ItemMessageModel(
    content: 'Hello!',
    image: 'assets/images/bgLogin.jpg',
    time: '8:02pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Bạn là ai thế?',
    image: 'assets/images/bgLogin.jpg',
    time: '8:02pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Xin chào, bạn là ai',
    image: 'assets/images/bgRegister.jpg',
    time: '8:03pm',
    type: false,
  ),
  ItemMessageModel(
    content: 'I am Trung',
    image: 'assets/images/bgLogin.jpg',
    time: '8:05pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Rất vui được làm quen với bạn',
    image: 'assets/images/bgRegister.jpg',
    time: '8:05pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Oh, tôi cũng vậy',
    image: 'assets/images/bgLogin.jpg',
    time: '8:06pm',
    type: false,
  ),
  ItemMessageModel(
    content: 'Hello!',
    image: 'assets/images/bgLogin.jpg',
    time: '8:02pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Bạn là ai thế?',
    image: 'assets/images/bgLogin.jpg',
    time: '8:02pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Xin chào, bạn là ai',
    image: 'assets/images/bgRegister.jpg',
    time: '8:03pm',
    type: false,
  ),
  ItemMessageModel(
    content: 'I am Trung',
    image: 'assets/images/bgLogin.jpg',
    time: '8:05pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Rất vui được làm quen với bạn',
    image: 'assets/images/bgRegister.jpg',
    time: '8:05pm',
    type: true,
  ),
  ItemMessageModel(
    content: 'Oh, tôi cũng vậy',
    image: 'assets/images/bgLogin.jpg',
    time: '8:06pm',
    type: false,
  ),
];