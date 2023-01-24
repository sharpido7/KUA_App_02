import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Storage{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  late var PhotoLink="";
  late var VideoLink= "";
  UploadTask? uploadTask;
  
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
 await storage.ref('test/$filesName').putFile(file).then((value) async{
 await storage.ref('test/$filesName').getDownloadURL().then((fileURL) async{    
       
     VideoLink=fileURL;
     
     print("After the add function,here's the Length  ${VideoLink.length}"); 
            
        
   });});
} on firebase_core.FirebaseException catch (e){
 print(e);
}
return VideoLink;
}


}