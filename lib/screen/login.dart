import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialtnt/screen/forget_password.dart';
import 'package:socialtnt/screen/home.dart';
import 'package:socialtnt/screen/main_screen.dart';
import 'package:socialtnt/screen/register.dart';
import 'package:socialtnt/widget/app_bar.dart';
import 'package:socialtnt/widget/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late bool visiblePass = true;
  bool error = false;
  final _globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () {FocusScope.of(context).unfocus();},
          child: Scaffold(
            // resizeToAvoidBottomInset: false,
            body: ListView(
              children: [
                AppBarWidget('Đăng nhập', context, Color.fromARGB(255, 95, 95, 95)),
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
                        'Đăng nhập để trải nghiệm những điều thú vị',
                        style: TextStyle(
                            color: Color.fromARGB(255, 121, 121, 121),
                            fontSize: 14,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      Image(
                        width: 250,
                        image: AssetImage('assets/images/bgLogin1.png'),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.8,                             
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.8,                           
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
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {Get.toNamed('/forgetPassword');},
                                child: const Text(
                                  'Quên mật khẩu',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 51, 51, 51),
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,                    
                  children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_globalkey.currentState!.validate()) {
                        //   print('Oke');
                        // };
                        Get.offAndToNamed(('/mainscreen'));
                      }, 
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
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)),
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
                      onPressed: () {Get.toNamed('/register');},
                      child: const Text(
                        'Bạn chưa có tài khoản? Đăng ký',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 59, 59, 59),
                        ),
                      ),
                    )
                
                  
                ],),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

}
