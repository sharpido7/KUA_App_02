
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_ideas_today/storage_service.dart';


class AudioUploadPage extends StatefulWidget {
  const AudioUploadPage({super.key});
 
  @override
  _AudioUploadPageState createState() => _AudioUploadPageState();
}

class _AudioUploadPageState extends State<AudioUploadPage> {
  @override
  TextEditingController author = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController courseTitle = new TextEditingController();
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];
  final Storage storage = Storage();
  double progress = 0.0;

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
        onPressed: () {
          Map<String, dynamic> data = {
            "Author": author.text,
            "category": category.text,
            "Titles": courseTitle.text,
            "Audio": storage.AudioLink,
            "Photo":storage.PhotoLink
          };
          FirebaseFirestore.instance.collection('Course').add(data);
        },
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

  Widget build(BuildContext context) {
    return Scaffold(
      //Added
      //
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('UPLOAD AUDIO FILE',
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
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg']);
                if (result == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("No file selected")));
                  return null;
                }
                final Photopath = result.files.single.path!;
                final PhotofileName = result.files.single.name;
                var task = storage
                    .uploadPhoto(Photopath, PhotofileName)
                    .then(((value) => {print('done')})) as UploadTask?;
                setState(() {});

                if (task == null) return;

                final snapshot = await task.whenComplete(() {});
                task.snapshotEvents.listen((TaskSnapshot event) {
                  progress =
      (event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
          100;
          
                });

                //  setState(() async{
                //   urlDownload = await snapshot.ref.getDownloadURL();
                //  });

                // print('Download-Link: $urlDownload');
                //  ThePhotoLink = storage.PhotoLink;
                print(Photopath);
                print(PhotofileName);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Background color
              ),
              child: new Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text('Upload Audio Cover Photo'),
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
            DynamicWidget(),
            SizedBox(height: 10.0),
            Container(
                height: 100.0,
                width: 100.0,
                child: LiquidCircularProgressIndicator(
                  value: progress,
                  valueColor: AlwaysStoppedAnimation(Colors.orange),
                  backgroundColor: Colors.white,
                  direction: Axis.vertical,
                  center: Text("$progress%"),
                )),

            Text("Upload Multiple Videos"),
            data.length == 0 ? DynamicTextField() : Result(),
            data.length == 0 ? SubmitButton() : new Container(),
          ],
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
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: new EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                     final result = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ['mp3','m4a','flac','wav','mkv']
              );
              if(result== null){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("No file selected"))
                );
                return null;
              }
              final path =result.files.single.path!;
              final fileName =result.files.single.name;
             // ignore: avoid_print
               await storage.UploadVideo(path,fileName).then(((value) => { print('done')}
               
              
              )) ;
              print(path); 
              // TheVideoLink = storage.VideoLink;
              print(fileName);
               print(storage.AudioLink);
                  
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Background color
                ),
                child: new Padding(
                  padding: new EdgeInsets.all(16.0),
                  child: new Text('Select audiofile '),
                ),
              ),
            ],
          )),
    );
  }
}
