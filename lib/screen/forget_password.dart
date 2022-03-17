import 'package:flutter/material.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/input_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(218, 130, 149, 190),
      child: SafeArea(
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [Color.fromARGB(136, 214, 214, 214), Color.fromARGB(73, 82, 82, 82)],
              ).createShader(rect),
              blendMode: BlendMode.darken,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bgLogin1.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(0, 255, 255, 255), BlendMode.darken),
                  ),
                ),
              ),
            ),
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Color.fromARGB(111, 129, 129, 129),
              body: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppBarWidget('Quên mật khẩu', context, Color.fromARGB(255, 255, 255, 255))
                  ),
                  Expanded(
                    flex: 4,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: Text(
                                'Bạn đã quên mật khẩu của mình, hãy điền đầy đủ thông tin dưới đây để lấy mật khẩu mới cho tài khoản của bạn',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),                    
                          ],
                        ),
                      ),
                    ),
                  
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InputField('Email', Icon(Icons.email)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InputField('Mật khẩu mới', Icon(Icons.lock)),
                          ),
                        ),                    
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    flex: 16,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,                    
                        children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            onPressed: () {}, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                              Text(
                                'Gửi',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.send),
                            ]),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 18)),
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 49, 94, 146)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )
                              )
                            )
                            // child: Text(
                            //   'Đăng nhập',
                            //   style: TextStyle(),
                            // ),
                          ),
                        ),                     
                      ],),
                    )
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}