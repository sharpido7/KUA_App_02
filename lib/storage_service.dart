import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
Future <void> uploadFile( String filePath,String filesName) async {
File file = File(filePath);
try {
 await storage.ref('test/$filesName').putFile(file);
} on firebase_core.FirebaseException catch (e){
 print(e);
}


}

}