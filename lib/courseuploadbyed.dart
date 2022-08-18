import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController author = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController courseTitle = new TextEditingController();
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = new Icon(Icons.add);
  List<String> toList1() {
    listDynamic.forEach((widget) {
      data.add(widget.lessonTitle.text);
    });

    return data.toList();
  }

  addDynamic() {
    if (data.length != 0) {
      floatingIcon = new Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 10) {
      return;
    }

    listDynamic.add(new DynamicWidget());
  }

  Result() {
    return Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${data[index]}"),
                    ),
                    new Divider()
                  ],
                ),
              );
            },
          ),
        ));
  }

  DynamicTextField() {
    return Flexible(
      flex: 2,
      child: new ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );
  }

  SubmitButton() {
    return Container(
      child: new ElevatedButton(
        onPressed: () => FirebaseFirestore.instance.collection('lessonstitlelist').add({
          "LessonsTitleList": toList1(),
          "Author": author.text,
          "Category": category.text,
          "CourseTitle": courseTitle.text,
          // "point": [
          //   'hi',
          //   'there'
          // ]
        }),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange, // Background color
        ),
        child: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Text('Submit Data'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Added
        //
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text('UPLOAD VIDEOS',
              style: TextStyle(color: Color.fromARGB(255, 241, 153, 55))),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              //MODIFICATIONS
              new Padding(
                padding: new EdgeInsets.all(12.0),
                child: TextField(
                  controller: courseTitle,
                  //decoration: new InputDecoration(hintText: 'Enter Lesson Title'),
                  style: TextStyle(color: Colors.orange),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.edit_calendar,
                          color: Color.fromARGB(255, 241, 153, 55)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 36, 36, 36),
                      hintText: 'Course Title',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 89, 89, 89)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0))),
                ),
              ),

              new Padding(
                padding: new EdgeInsets.all(12.0),
                child: TextField(
                  controller: author,
                  //decoration: new InputDecoration(hintText: 'Enter Lesson Title'),
                  style: TextStyle(color: Colors.orange),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,
                          color: Color.fromARGB(255, 241, 153, 55)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 36, 36, 36),
                      hintText: 'Author',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 89, 89, 89)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0))),
                ),
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Background color
                ),
                child: new Padding(
                  padding: new EdgeInsets.all(16.0),
                  child: new Text('Upload Photo'),
                ),
              ),

              new Padding(
                padding: new EdgeInsets.all(12.0),
                child: TextField(
                  controller: category,
                  //decoration: new InputDecoration(hintText: 'Enter Lesson Title'),
                  style: TextStyle(color: Colors.orange),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.military_tech,
                          color: Color.fromARGB(255, 241, 153, 55)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 36, 36, 36),
                      hintText: 'Category',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 89, 89, 89)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0))),
                ),
              ),

              //MODIFICATIONS
              //
              //
              Text("Upload Multiple Videos"),
              data.length == 0 ? DynamicTextField() : Result(),
              data.length == 0 ? SubmitButton() : new Container(),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: addDynamic,
          child: floatingIcon,
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController lessonTitle = TextEditingController();
  TextEditingController courseTitle = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.all(8.0),
        child: Column(
          children: [
            //MODIFICATIONS

            //MODIFICATIONS
            new Padding(
              padding: new EdgeInsets.all(16.0),
              child: TextField(
                controller: lessonTitle,
                style: TextStyle(color: Colors.orange),
                //decoration: new InputDecoration(hintText: 'Enter Lesson Title'),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.edit_calendar,
                        color: Color.fromARGB(255, 241, 153, 55)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 36, 36, 36),
                    hintText: 'Enter Lesson Title',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 89, 89, 89)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0))),
              ),
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Background color
              ),
              child: new Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text('Select a video '),
              ),
            ),
          ],
        ));
  }
}
