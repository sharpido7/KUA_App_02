import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ideas_today/storage_service.dart';


class CourseUpload extends StatefulWidget {
  const CourseUpload({Key? key}) : super(key: key);
  _CourseUploadState createState() => _CourseUploadState();
}

Widget Field(textconroller, hintText) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
      controller: textconroller,
      decoration: InputDecoration(
        hintText: '$hintText',
        fillColor: Colors.white.withOpacity(0.6),
        filled: true,
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
          borderSide: new BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
      ),
    ),
  );
}

class _CourseUploadState extends State<CourseUpload> {
  TextEditingController author = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController title = new TextEditingController();
  TextEditingController sampledata1 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CourseUp();
  }
}

class CourseUp extends StatefulWidget {
  const CourseUp({Key? key}) : super(key: key);
  _CourseUpState createState() => _CourseUpState();
}

class _CourseUpState extends State<CourseUp> {
  TextEditingController author = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController title = new TextEditingController();
  TextEditingController sampledata1 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Storage storage =Storage();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Course Upload Page"),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(children: [
              Field(author, 'Author'),
              Field(category, 'Category'),
              Field(title, 'Course Title'),
              ElevatedButton(
       
        onPressed: ()async{
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: ['png','jpg']
        );
        if(result== null){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No file selected"))
          );
          return null;
        }
        final path =result.files.single.path!;
        final fileName =result.files.single.name;
        storage.uploadFile(path,fileName).then(((value) => print('done')));
        print(path);
        print(fileName);
      }, child: Text("Upload Image", style: TextStyle(color:Colors.black)))
              SizedBox(
                height: 20.0,
              ),

              //TextFormField(controller: sampledata1, decoration: InputDecoration(hintText: 'sample data')),
              FlatButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "author": author.text,
                    "category": category.text,
                    "title": title.text,
                  };
                  FirebaseFirestore.instance.collection('Course').add(data);
                },
                child: Text('Submit'),
                color: Colors.orange,
              )
            ]),
          ),
        ),
      ),
    );
  }
}


