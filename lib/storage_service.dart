import 'dart:io';
//import 'dart:js';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Storage{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  late var PhotoLink="";
  late var AudioLink= "";
  UploadTask? uploadTask;
   double progress = 0.0;
  
  //List <String> VideoLink=[];
Future <String> uploadPhoto( String filePath,String filesName) async {
File file = File(filePath);
try {
 await storage.ref('test/$filesName').putFile(file);
    storage.ref('test/$filesName').getDownloadURL().then((fileURL) {    
       print(fileURL);
       PhotoLink = fileURL;    
        
   });    
} on firebase_core.FirebaseException catch (e){
 print(e);
}
return PhotoLink;
}




Future  UploadVideo( String filePath,String filesName) async {
File file = File(filePath);

try {
  uploadTask = storage.ref('test/$filesName').putFile(file);
  // final snapshot = await uploadTask!.whenComplete((){});

  //  uploadTask?.snapshotEvents.listen((event) {
  //                     setState(() { 
  //                       progress = ((event.bytesTransferred.toDouble() /
  //                                   event.totalBytes.toDouble()) *
  //                               100)
  //                           .roundToDouble();

  //                       if (progress == 100) {
  //                         event.ref
  //                             .getDownloadURL()
  //                             .then((downloadUrl) => print(downloadUrl));
  //                       }

  //                       print(progress);
  //                     });
  //                   });
                  









 await storage.ref('test/$filesName').getDownloadURL().then((fileURL) async{    
       
     AudioLink=fileURL;
     
     print("After the add function,here's the Length  ${AudioLink.length}"); 
            
        
   });
} on firebase_core.FirebaseException catch (e){
 print(e);
}
return AudioLink;
}

  void setState(Null Function() param0) {}


}