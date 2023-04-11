import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_ideas_today/courseuploadbyed.dart';
import 'package:my_ideas_today/new_homepage.dart';
import 'package:get/get.dart';
import 'package:my_ideas_today/otp_screen.dart';
import 'package:my_ideas_today/registration.dart';
import 'package:my_ideas_today/upload.dart';
import 'package:my_ideas_today/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_ideas_today/newcoursepage.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //   //ADDED TO FIX TILE VIDEO CHANGING BUG
  // List<String> videoLinks2 = [
  //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  //   'https://www.youtube.com/watch?v=GJ6_nOqtuLw&list=PLyQSN7X0ro22zanLOcvkaSY-IZqheFYM5&index=3'
  // ];

  // List<String> instructorFirstName2 = [
  //   'DIAMOND',
  //   'JOKATE',
  //   'EDWIN',
  // ];

  // List<String> videoTitles = [
  //  'How to bocome a leader','Starting on Music','The begining'
  // ];


  @override
  void initState() {
  
     getValidationData().whenComplete(() async{
           Timer(
        Duration(seconds: 5),
        () => Get.to(finalPhone == null ? Registration() :Registration() /*Home()*/
        
//         Coursepage(
//     ['https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
//     'https://www.youtube.com/watch?v=GJ6_nOqtuLw&list=PLyQSN7X0ro22zanLOcvkaSY-IZqheFYM5&index=3'
//   ],
// [
//   'How to bocome a leader','Starting on Music','The begining'
// ],
//   [
//     'DIAMOND',
//     'JOKATE',
//     'EDWIN',
//   ]
//         )
        )           
            );
     });
     super.initState();
  }
  
   Future getValidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedPhone = sharedPreferences.getString('phone');
    setState((){
      finalPhone = obtainedPhone!;
    });
    print(finalPhone);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black ,
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.black),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 80.0)),
            Text("KUA App",
                style: TextStyle(
                  color: Color.fromARGB(255, 241, 153, 55),
                  fontSize: 29,
                )),
            Expanded(
              flex: 2,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(backgroundColor: Color.fromARGB(255, 142, 174, 201),radius: 90.0,
                  // backgroundImage: AssetImage('assets/Group 90.png'),),
                  Image.asset('assets/Group 90.png', height: 170, width: 170),
                  // Icon( Icons.wb_incandescent_rounded,
                  //             color: Color.fromARGB(255, 241, 153, 55),size: 40),
                  Padding(padding: EdgeInsets.only(top: 0.0)),
                ],
              )),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  // Padding(padding: EdgeInsets.only(top: 20.0)),
                  // Text("Know your way around.",
                  //     style: TextStyle(
                  //       color: Colors.black38,
                  //       fontSize: 20,
                  //     ))
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}