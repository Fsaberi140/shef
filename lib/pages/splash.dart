import 'package:flutter/material.dart';
import 'package:sheff_new/pages/homeScreen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute (builder: (context)=>HomeScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        child:
          Image.asset('assets/img/foods/logo.jpg',width: 90, height: 90,
          )

      ),
    );
  }
}