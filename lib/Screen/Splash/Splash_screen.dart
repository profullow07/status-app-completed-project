import 'package:all_status_bangla/Colors/colors_code.dart';
import 'package:all_status_bangla/Screen/HomeScreen/Home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home_screen()));
    });
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splashlogo.png",
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'হ্যালো স্বাগতম',
            style: TextStyle(
                color: Colors.white, fontSize: 20, letterSpacing: 1.3),
          ),
          Text('500+ সেরা',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
          Text('স্ট্যাটাস অ্যাপস',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
        ],
      )),
    );
  }
}
