import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_ideas_today/new_homepage.dart';
import 'package:get/get.dart';
import 'package:my_ideas_today/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
     getValidationData().whenComplete(() async{
           Timer(
        Duration(seconds: 5),
        () => Get.to(finalPhone == null ? Registration() : Home())
            
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
                  //CircleAvatar(backgroundColor: Colors.blue,radius: 90.0,
                  //backgroundImage: AssetImage('assets/daladala3.png'),)
                  // Image.asset('assets/daladala3.png', height: 200, width: 200),
                  Icon( Icons.wb_incandescent_rounded,
                              color: Color.fromARGB(255, 241, 153, 55),size: 40),
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