import 'package:flutter/material.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(218, 96, 142, 240),
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
                    image: AssetImage('assets/images/bgLogin.jpg'),
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
                    child: AppBarWidget('Đăng nhập', context, Color.fromARGB(255, 255, 255, 255))
                  ),
                  Expanded(
                    flex: 6,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Social photo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontFamily: 'Lobster',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Đăng nhập để trải nghiệm những điều thú vị',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  fontSize: 14,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
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
                            child: InputField('Mật khẩu', Icon(Icons.lock)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {Navigator.pushNamed(context, 'forgetPassword');},
                                child: const Text(
                                  'Quên mật khẩu',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,                    
                        children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            onPressed: () {Navigator.pushNamed(context, 'home');}, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                              Icon(Icons.login),
                              SizedBox(width: 10),
                              Text(
                                'Đăng nhập',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
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
                        TextButton(
                            onPressed: () {Navigator.pushNamed(context, 'register');},
                            child: const Text(
                              'Bạn chưa có tài khoản? Đăng ký',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          )
                    
                        
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
