import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WellCome extends StatelessWidget {
  const WellCome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end:
                    Alignment(0.2, 0.0), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  Color.fromARGB(255, 11, 14, 161),
                  Color.fromARGB(255, 4, 2, 112)
                ], // red to yellow
                tileMode: TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                          child: Column(
                            children: const [
                              SizedBox(height: 30),
                              Text('WellCome',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                    color: Color.fromARGB(255, 216, 214, 214),
                                  )),
                              SizedBox(height: 20),
                              Text('Social photo',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 9, 194, 18),
                                    fontFamily: 'Lobster',
                                  )),
                            ],
                          )
                        )
                    ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bgWellcome.png'),
                        ),
                      )
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                
                                children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {Navigator.pushNamed(context, 'login');},
                                    child: Text('Login'),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      primary: Color.fromARGB(255, 255, 255, 255),
                                      backgroundColor: Color.fromARGB(255, 19, 22, 189),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {Navigator.pushNamed(context, 'register');},
                                    child: Text('Register'),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      primary: Color.fromARGB(255, 255, 255, 255),
                                      backgroundColor: Color.fromARGB(255, 11, 37, 184),
                                    ),
                                  ),
                                )
                              ],
                                                      ),
                            ),
                          )
                        ],
                      )
                    )
                  )
                ],
              ),
            )));
  }
}
