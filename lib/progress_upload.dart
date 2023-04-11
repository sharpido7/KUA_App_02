import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: 50.0,
              ),
              TextButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    Uint8List? file = result.files.first.bytes;
                    String fileName = result.files.first.name;

                    UploadTask task = FirebaseStorage.instance
                        .ref()
                        .child("files/$fileName")
                        .putData(file!);

                    task.snapshotEvents.listen((event) {
                      setState(() {
                        progress = ((event.bytesTransferred.toDouble() /
                                    event.totalBytes.toDouble()) *
                                100)
                            .roundToDouble();

                        print(progress);
                      });
                    });
                  }
                },
                child: Text("Upload"),
              ),
              Container(
                  height: 200.0,
                  width: 200.0,
                  child: LiquidCircularProgressIndicator(
                    value: progress,
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    backgroundColor: Colors.white,
                    direction: Axis.vertical,
                    center: Text("$progress"),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
