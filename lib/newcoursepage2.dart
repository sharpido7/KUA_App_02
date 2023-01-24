// import 'package:flutter/material.dart';
// import 'package:my_ideas_today/chewie_list_item.dart';
// import 'package:video_player/video_player.dart';
// //import 'package:url_launcher/url_launcher.dart';

// class Coursepage2 extends StatefulWidget {
//   //final String video;
//   late final int total;

//   String test = "PURCHASE COURSE";
//    List<String> videoLinks2 = [];
//    List<String> videoTitles = [];
//    List<String> instructorFirstName2 = [];
//   int linknumber = 0;
//   Coursepage2(
//     /*this.video, this.Author, this.Title, */
//     List<String> videoLinks2,
//     List<String> videoTitles,
//       List<String> instructorFirstName2,
//     int linknumber,
//   ) {
//     this.videoLinks2 = videoLinks2;
//     this.videoTitles = videoTitles;
//     this.instructorFirstName2 = instructorFirstName2;
//     this.linknumber = linknumber;
//     this.total = videoTitles.length;
//   }

//   @override
//   State<Coursepage2> createState() => _Coursepage2State();
// }

// class _Coursepage2State extends State<Coursepage2> {
//   //int get linknumber => linknumber;
//   String textString = 'PURCHASE COURSE';
//   //int get n = linknumber;
//   //
//   //int lateee = 0;
//   buttonChange() {
//     setState(() {
//       textString = 'PLAY FIRST LESSON';
//     });
//   }

//   int videoNumber = 0;

//   int playNextVideo() {
//     // setState(() {
//     //   videoNumber = tileNumber;
//     //   print(videoNumber);
//     // });
//     // return videoNumber;
//     // print(videoNumber);
//     //
//     return videoNumber;
//   }

//   // Widget theTiles(String title, String sub, IconData icon) {
//   Widget theTiles(String title, String sub, IconData icon,
//        List<String> videoTitles,  List<String> videoLinks, int linknumber) {
//     return ListView.builder(
//         itemCount: videoTitles.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           int returnIndex() {
//             return index;
//             print(index);
//             print('index');
//           }

//           String bb;
//           bb = videoTitles[index];

//           return Column(
//             children: [
//               ListTile(
//                 trailing: Icon(icon, color: Color.fromARGB(255, 241, 153, 55)),
//                 focusColor: Color.fromARGB(255, 241, 153, 55),
//                 title: Text(videoTitles[index] /*+ '$index' + '$linknumber'*/,
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white)),
//                 subtitle: Text(sub,
//                     style: TextStyle(fontSize: 20.0, color: Colors.white)),
//                 tileColor: Color.fromARGB(255, 36, 36, 36),
//                 // onTap: () {
//                 //   final Uri _emailLaunchUri = Uri(
//                 //     // scheme: thescheme,
//                 //     path: videoLinks[index],
//                 //   );
//                 //

//                 // launch(_emailLaunchUri.toString());
//                 // }
//                 onTap: () => Navigator.pushNamed(context, '/'),
//                 //Navigator.pop(context), //Navigator.pushNamed(context, '/'),
//                 // Navigator.pop(context, true);
//                 //ed(videoLinks, index),
//                 //     () {
//                 //   print('yeeey');
//                 //   print(videoLinks[index]);

//                 // }, //eddy,
//                 //     () {
//                 //   lateee = index;
//                 //   print(videoLinks[index]);
//                 //   print(lateee);

//                 //   // setState(() {
//                 //   //   videoNumber = index;
//                 //   //   print(videoNumber);
//                 //   // });
//                 //   // //eddy

//                 //   // playNextVideo();
//                 // }
//               ),
//               Container(height: 5.0, color: Colors.black)
//             ],
//           );
//         });
//   }

//   Widget eddy(int linknumber) {
//     //int oops = 0;
//     // setState(() {
//     //   videoNumber = lateee;
//     // });
//     return ListView.builder(
//         itemCount: 1,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           //oops = index;
//           return ChewieListItem(
//             videoPlayerController:
//                 VideoPlayerController.network(widget.videoLinks2[linknumber]
//                     //videoLinks[playNextVideo()], // video,
//                     ),
//             looping: true,
//           );
//         });
//   }

//   ed(bb) {
//     print(bb);
//   }

//   // ed(aa, ind) {
//   //   List<String> bb = [];
//   //   return ListView.builder(
//   //       itemCount: aa.length,
//   //       shrinkWrap: true,
//   //       physics: NeverScrollableScrollPhysics(),
//   //       itemBuilder: (context, index) {
//   //         bb = aa;
//   //         return Container();
//   //       });
//   //   print(bb);
//   // }

//   PlayNextVideo() {
//     return ChewieListItem(
//       videoPlayerController: VideoPlayerController.network(
//         widget.videoLinks2[videoNumber], // video,
//       ),
//       looping: true,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Course'),
//             backgroundColor: Colors.black,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.white),
//               onPressed: () {
//                 //          setState(() {
//                 //   widget.videoController.pause();
//                 //  Navigator.pushNamed(context, '/');
//                 // });
//                 Navigator.pushNamed(context, '/');
//               },
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Column(children: [
//               Container(
//                 height: 200,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   colors: [
//                     Color.fromARGB(255, 89, 89, 89),
//                     Color.fromARGB(255, 89, 89, 89)
//                   ],
//                 )),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Container(
//                             height: 380,
//                             width: 355,
//                             child: eddy(widget.linknumber),
//                             // ListView.builder(
//                             //     itemCount: 1,
//                             //     shrinkWrap: true,
//                             //     physics: NeverScrollableScrollPhysics(),
//                             //     itemBuilder: (context, index) {
//                             //       return ChewieListItem(
//                             //         videoPlayerController:
//                             //             VideoPlayerController.network(
//                             //                 widget.videoLinks[videoNumber]
//                             //                 //videoLinks[playNextVideo()], // video,
//                             //                 ),
//                             //         looping: true,
//                             //       );
//                             //     }),
//                           ),
//                         ),
//                         /*CircleAvatar(
//                           backgroundColor: Colors.white,
//                           child: Icon(
//                             Icons.play_arrow,
//                             color: Color.fromARGB(255, 89, 89, 89),
//                           ),
//                           radius: 14.0,
//                         ),
//                         */
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     color: Colors.black,
//                     child: Center(
//                       child: ListView.builder(
//                           itemCount: 1,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             return Text(widget.instructorFirstName2[index],
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 20.0, color: Colors.white));
//                           }),
//                     ),
//                   ),
//                 )
//               ]),

//               //Title of ther course
//               Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//                 Expanded(
//                   child: Container(
//                       padding: EdgeInsets.all(20),
//                       color: Colors.black,
//                       child: Center(
//                           child: Text('Title',
//                               style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)))),
//                 )
//               ]),
//               Container(
//                 color: Colors.black,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: EdgeInsets.all(20),
//                           color: Colors.black,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 primary: Color.fromARGB(255, 241, 153, 55)),
//                             onPressed: buttonChange, //() {},
//                             child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Text(
//                                 textString,
//                                 style: TextStyle(
//                                     fontSize: 25, color: Colors.black),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Icon(
//                         Icons.bookmarks,
//                         color: Color.fromARGB(255, 241, 153, 55),
//                       )
//                     ]),
//               ),
//               Container(
//                 color: Color.fromRGBO(0, 0, 0, 1),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             '${widget.total} lessons',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Color.fromARGB(255, 241, 153, 55),
//                             ),
//                           ),
//                         ),
//                         Text('1h 15m',
//                             style: TextStyle(
//                                 fontSize: 20.0,
//                                 color: Color.fromARGB(255, 241, 153, 55)))
//                       ]),
//                 ),
//               ),
//               // theTiles('1.What is Leadrship', '2:09', Icons.done),
//               // theTiles('2.My Story', '1:00', Icons.done),
//               // theTiles('3.Passion', '2:09', Icons.done),
//               // theTiles('4.The Passion', '2:09', Icons.done),
//               // theTiles('6.The whole Story', '2:09', Icons.file_download),
//               theTiles('1.What is Leadrship', '2:09', Icons.done,
//                   widget.videoTitles, widget.videoLinks2, widget.linknumber),
//             ]),
//           )),
//     );
//   }
// }
