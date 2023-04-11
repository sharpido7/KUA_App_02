import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ideas_today/new_homepage.dart';
import 'package:my_ideas_today/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Upload extends StatefulWidget {
  const Upload({key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
   final formkey = GlobalKey<FormState>();

  UploadTask? task;
  
  final TextEditingController _course_title = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _lesson_title = TextEditingController();
   final Storage storage =Storage();
    bool isloading = false;

  
  var urlDownload="";



  @override
  Widget build(BuildContext context) {
   
    UploadTask? task;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         backgroundColor: Colors.black38,
         title: Text('KUA App',style: TextStyle( color: Color.fromARGB(255, 241, 153, 55))),),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 350,
                      margin: EdgeInsets.only(right: 20),
                      child: Text("Upload Course",style: TextStyle(fontSize: 30,
                      color: Colors. white
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                       margin: EdgeInsets.only(right: 230),
                      child: Text('',style: TextStyle(fontSize: 40,
                      color: Color.fromARGB(255, 241, 153, 55),fontWeight:FontWeight.bold,
                      ),),
                    ),
                  ),
                                       SizedBox(
                            //  height: 68,
                            //  width:64,
                             child: TextFormField(
                                  //initialValue: 'First Name',
                                  validator: (value) => (value!.isEmpty) ? ' Please enter Course Title' : null,
                                  decoration:  InputDecoration(
                                    
                                  prefixIcon: Icon( Icons.edit_calendar,
                                  color: Color.fromARGB(255, 241, 153, 55)
                                  ),
                                  
                                  filled: true,
                                   fillColor: Color.fromARGB(255, 36, 36, 36),
                                  hintText: 'Course Title',
                                  hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0.0))),
                            //  onChanged: (value){
                            //    if(value.length==1){
                            //      FocusScope.of(context).nextFocus();
                            //    }
                            //  },
                            controller:_course_title,
                             style: Theme.of(context).textTheme.headline6,
                             keyboardType: TextInputType.name,
                            // textAlign:TextAlign.center,
                            //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                            //  FilteringTextInputFormatter.digitsOnly
                             
                             ),
                           ),
                           SizedBox( height: 10,),
          
                           SizedBox(
                             height: 68,
                            //  width:64,
                             child: TextFormField(
                                  //initialValue: 'First Name',
                                  validator: (value) => (value!.isEmpty) ? ' Please enter Author' : null,
                                  decoration:  InputDecoration(
                                    
                                  prefixIcon: Icon( Icons.person,
                                  color: Color.fromARGB(255, 241, 153, 55)
                                  ),
                                  filled: true,
                                   fillColor: Color.fromARGB(255, 36, 36, 36),
                                  hintText: 'Author',
                                  hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0.0))),
                            //  onChanged: (value){
                            //    if(value.length==1){
                            //      FocusScope.of(context).nextFocus();
                            //    }
                            //  },
                            controller:_author,
                             style: Theme.of(context).textTheme.headline6,
                             keyboardType: TextInputType.name,
                            // textAlign:TextAlign.center,
                            //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                            //  FilteringTextInputFormatter.digitsOnly
                             
                             ),
                           ),SizedBox( height: 10),
                            Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           primary: Colors.orange
                         ),
           
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
            task = storage.uploadPhoto(path,fileName).then(((value) => { print('done')}
            )) as UploadTask? ;
                setState(() {});
      
           if (task == null) return;
      
          final snapshot = await task!.whenComplete(() {});
          //  setState(() async{
          //   urlDownload = await snapshot.ref.getDownloadURL();
          //  });
          
          // print('Download-Link: $urlDownload');
          //  ThePhotoLink = storage.PhotoLink;
            print(path);
            print(fileName);
          }, child: Text("Upload Photo", style: TextStyle(color:Colors.black))) 
        
        
        
                             ],
                           ),
                          SizedBox(height: 10),
                            SizedBox(
                            //  height: 68,
                            //  width:64,
                             child: TextFormField(
                                  //initialValue: 'First Name',
                                  validator: (value) => (value!.isEmpty) ? ' Category' : null,
                                  decoration:  InputDecoration(
                                    
                                  prefixIcon: Icon( Icons.military_tech,
                                  color: Color.fromARGB(255, 241, 153, 55)
                                  ),
                                  filled: true,
                                   fillColor: Color.fromARGB(255, 36, 36, 36),
                                  hintText: 'Category',
                                  hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0.0))),
                            //  onChanged: (value){
                            //    if(value.length==1){
                            //      FocusScope.of(context).nextFocus();
                            //    }
                            //  },
                            controller:_category,
                             style: Theme.of(context).textTheme.headline6,
                             keyboardType: TextInputType.text,
                            // textAlign:TextAlign.center,
                            //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                            //  FilteringTextInputFormatter.digitsOnly
                             
                             ),
                           ),
                           SizedBox( height: 10,),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [ 
          
                            SizedBox(
                             height: 68,
                             width:250,
                             child: TextFormField(
                                  //initialValue: 'First Name',
                                  // obscureText: true,
                                  validator: (value) => (value!.isEmpty) ? ' Please enter Lesson Title' : null,
                                  decoration:  InputDecoration(
                                    
                                  prefixIcon: Icon( Icons.edit_calendar,
                                  color: Color.fromARGB(255, 241, 153, 55)
                                  ),
                                  filled: true,
                                   fillColor: Color.fromARGB(255, 36, 36, 36),
                                  hintText: 'Lesson title',
                                  hintStyle: TextStyle( color: Color.fromARGB(255, 89, 89, 89)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0.0))),
                            //  onChanged: (value){
                            //    if(value.length==1){
                            //      FocusScope.of(context).nextFocus();
                            //    }
                            //  },
                            controller:_lesson_title,
                             style: Theme.of(context).textTheme.headline6,
                             keyboardType: TextInputType.text,
                            // textAlign:TextAlign.center,
                            //  inputFormatters: [LengthLimitingTextInputFormatter(1),
                            //  FilteringTextInputFormatter.digitsOnly
                             
                             ),
                           ),
                          // SizedBox( height: 10,),
        
                           
                     SizedBox(
                    height: 58,
                     width:120,
                       child: ElevatedButton(

           style: ElevatedButton.styleFrom(
          
                             primary: Colors.orange
                           ),
            onPressed: ()async{
            final result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['mp4','mkv']
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
              storage.UploadVideo(path,fileName).then(((value) => { print('done')}
             
            
            )) ;
            print(path); 
            // TheVideoLink = storage.VideoLink;
            print(fileName);
          }, child: Text("Upload video", style: TextStyle(color:Colors.black))),
                     ) 
        
        
        
                             ],
                           ),
                           SizedBox( height: 10,),
                           Row(
                           mainAxisAlignment: MainAxisAlignment.end, 
                           children: [
                            FloatingActionButton(
                              backgroundColor: Color.fromARGB(255, 241, 153, 55),
                              onPressed: (){},
                              child: Icon( Icons.add,
                                    color: Colors.black,
                                    ),
                            ),
                           ],
                           ),
                            SizedBox( height: 10,),
        
                                      Row(
                 children: [
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.symmetric(horizontal:15),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: Colors.orange
                         ),
        
                          onPressed: ()async { 
                            if (formkey.currentState!.validate()) {
                                  setState(() {
                                    isloading = true;
                                  }); 
                             //_UploadState.buildProgress();
                             final CourseTitle= _course_title.text;
                              final Author= _author.text;
                              final Category= _category.text;
                             final Lesson_Title= _lesson_title.text ;
        
                             UploadCourse(CourseTitle:CourseTitle,Author:Author,Category:Category,LessonTitle:Lesson_Title);
                              
               //_saveUserInfo();
                     
        
          
        
        
               //if(_form.currentState.validate()){
                 
                //Here is whare we have the shared preferences 
                 
                      
              // }
        
               //This is for the Homepage
        
                  //        Navigator.of(context).push(
                  //    MaterialPageRoute(builder: (context)=>HomePage())
                  //  );
        
        
        
              }},
                          
                  
                        
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('UPLOAD COURSE' ,style: TextStyle(fontSize: 25,color: Colors. black),),
                          ),
                        ),
                     ),
                   ),
                 ],
               ),SizedBox(height:10),
        //  Row(
        //                          mainAxisAlignment: MainAxisAlignment.center,
        //                          children: [
        //                            Text('Already Registered?',
        //                            style:TextStyle( color:Colors.white,fontSize: 23) 
        //                            ), TextButton(onPressed: null, child:Text('LOGIN',style:TextStyle( color:Colors.orange,fontSize: 25)))
        //                          ],
        //                        )
                ],
              )),
        ),
      ),

    );
    
  }

Future UploadCourse({required CourseTitle, required Author,required Category,required LessonTitle })async{
 
 
 
 
 
 
  final docUser= FirebaseFirestore.instance.collection("Course").doc();

  final json= {
    "Course title":CourseTitle,
    "Author":Author,
    "Photo":storage.PhotoLink,
    "Category":Category,
    "Titles": LessonTitle,
    "Audio":storage.AudioLink
  };
  await docUser.set(json);

     Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );

}

// widget.buildProgress()=> StreamBuilder<TaskSnapshot>(
  
//   stream: uploadTask?.snapshotEvents,
//   builder:(context, snapshot) {
//     if (snapshot.hasData){
//   final data = snapshot.data!;
//   double progress = data.bytesTransferred/data.totalBytes;
//     }else{
//        return const SizedBox(height:50
//        child: Stack(
//         fit:StackFit.expand,
//         children: [
//           LinearProgressIndicator(
//            value:progress,
//             backgroundColor: Colors.grey,
//             color:Colors.orange,
//           ),
//           Center(
//             child:Text(
//             '${(100*progress).roundToDouble()}%'
//             style: const TextStyle(color:Colors.black87)

//             )) ,)
          

//         ],

//        ),
       
       
       
//        );
//     }
//   });








}
