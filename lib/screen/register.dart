import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool visiblePass = true;
  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Stack(
          children: [            
            Scaffold(
              // resizeToAvoidBottomInset: false,
              body: ListView(
                children: [
                  AppBarWidget('Đăng ký', context, Color.fromARGB(255, 66, 66, 66)),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Social photo',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 42,
                              fontFamily: 'Lobster',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Đăng ký tài khoản để trở thành thành viên',
                          style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontSize: 14,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Form(
                      key: _globalkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height * 0.08,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.8,                           
                            child: Center(                            
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: "Họ tên",
                                  prefixIcon: Icon(Icons.person),                                
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) return "Bạn chưa điền họ tên";
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.8,                          
                            child: Center(
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.email),                                 
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) return "Bạn chưa điền email";
                                  if (!value.contains('@')) return "Email không đúng định dạng";
                                  return null;
                                },
                              ),
                            ),
                          ),                            
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(                      
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                obscureText: visiblePass,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon( visiblePass ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        visiblePass = !visiblePass;
                                      });
                                    }, 
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) return "Bạn chưa điền mật khẩu";
                                  if (value.length < 8) return "Mật khẩu phải có ít nhất 8 kí tự";
                                  return null;
                                },
                              ),
                            ),
                          ),                      
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,   
                    mainAxisAlignment: MainAxisAlignment.center,                 
                    children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_globalkey.currentState!.validate()) {
                            print('Oke');
                          }
                        }, 
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
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )
                          )
                        )
                      ),
                    ),
                    TextButton(
                        onPressed: () {Get.toNamed('/login');},
                        child: const Text(
                          'Bạn đã có tài khoản? Đăng nhập',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 61, 61, 61),
                          ),
                        ),
                      )
                  
                    
                  ],),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}