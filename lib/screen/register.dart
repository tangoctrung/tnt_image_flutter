import 'package:flutter/material.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 61, 75, 112),
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
                    image: AssetImage('assets/images/bgRegister.jpg'),
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
                    child: AppBarWidget('Đăng ký', context, Color.fromARGB(255, 255, 255, 255))
                  ),
                  Expanded(
                    flex: 3,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Social photo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontFamily: 'Lobster',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Đăng ký tài khoản để trở thành thành viên',
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
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: InputField('Họ tên', Icon(Icons.supervised_user_circle)),
                          ),
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: InputField('Email', Icon(Icons.email)),
                          ),
                        ),
                        
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: InputField('Mật khẩu', Icon(Icons.lock)),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,                 
                        children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            onPressed: () {}, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                              Icon(Icons.app_registration),
                              SizedBox(width: 10),
                              Text(
                                'Đăng ký',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ]),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 18)),
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 78, 107, 141)),
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
                            onPressed: () {Navigator.pushNamed(context, 'login');},
                            child: const Text(
                              'Bạn đã có tài khoản? Đăng nhập',
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