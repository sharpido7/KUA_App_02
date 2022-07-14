import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ideas_today/storage_service.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image', style: TextStyle(color: Color.fromARGB(255, 241, 153, 55))),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: [
                  'png',
                  'jpg'
                ]);
                if (result == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No file selected")));
                  return null;
                }
                final path = result.files.single.path!;
                final fileName = result.files.single.name;
                storage.uploadFile(path, fileName).then(((value) => print('done')));
                print(path);
                print(fileName);
              },
              child: Text("Upload Image", style: TextStyle(color: Colors.black)))),
    );
  }
}
