import 'package:flutter/material.dart';
import 'package:mark_manager/auth/logintest.dart';


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
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage(onTap: () {  }),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        child: Text('mark_manager\n\nSPLASH loading ...\n ',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold
            )
        ),
      ),
      ),
    );
  }

}