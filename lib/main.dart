import 'package:easy_audio_player/helpers/init_just_audio_background.dart';
import 'package:easy_audio_player/models/notification_configuration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ideas_today/registration.dart';
import 'package:my_ideas_today/new_homepage.dart';
import 'package:get/get.dart';
import 'package:my_ideas_today/splashscreen.dart';
import 'package:my_ideas_today/upload.dart';
import 'package:just_audio/just_audio.dart';

void  main() async{
  await initJustAudioBackground(NotificationSettings(androidNotificationChannelId: 'com.example.example'));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

 FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
  
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Welcome click to Upload to Firestore',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  (){
                  Map<String, dynamic> data = {
                    "author": 'Gils',
                    "category":'Music',
                    "title": 'Always',
                  };
                  FirebaseFirestore.instance.collection('Movie').add(data);
                  print("Done");
                },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
