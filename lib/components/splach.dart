import 'package:flutter/material.dart';

import '../views/student.login.views.dart';


class Splash extends StatefulWidget {

  const  Splash({super.key });

  @override
  SplashState createState() => SplashState();
// State<LoginPage> createState() => _LoginPageState();
}

class SplashState extends State<Splash> {
  //const Splash({Key? key}) : super(key: key);

  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage(onTap: () {  }),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Stack(
          children: [
        Center(
        child: Container(
        child: Text('mark_manager\n\n ',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold
            )
        ),
      ),

      ),
            Positioned(
              left: 30,
              right: 30,
              bottom: 100,
              child: Container(
                height: 7.0,
                child: LinearProgressIndicator(),
              ),
              //LinearProgressIndicator(),
            ),
  ],),
    );
  }

}