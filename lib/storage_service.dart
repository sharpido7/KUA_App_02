import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';

class Storage{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  late var PhotoLink="";
  late var VideoLink= [];
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
 await storage.ref('test/$filesName').putFile(file);
  storage.ref('test/$filesName').getDownloadURL().then((fileURL) {    
       
        VideoLink.add(fileURL);    
        
   });
} on firebase_core.FirebaseException catch (e){
 print(e);
}
return VideoLink;
}


}