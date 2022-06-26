import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ideas_today/registration.dart';
import 'package:my_ideas_today/new_homepage.dart';

void  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
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
