import 'package:easy_audio_player/widgets/players/basic_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:easy_audio_player/helpers/init_just_audio_background.dart';
import 'package:easy_audio_player/models/models.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_ideas_today/chewie_list_item.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pod_player/pod_player.dart';
import 'package:audio_service/audio_service.dart';



class Coursepage extends StatefulWidget {
  //final String video;
  late final int total;
  // final String Title;
  List<dynamic> videoLinks = [];
  List<dynamic> videoTitles = [];
  String instructorFirstName='';
  String Title='';
  String Thevideo='';
  String AudioLink='';
  String Photolink='';
 

  Coursepage(
    /*this.video, this.Author, this.Title, */
    /*List<dynamic> videoLinks,
    List<dynamic> videoTitles,*/
    String instructorFirstName,
     String Title,
     String Photolink,
     String AudioLink,
  
  ) {
    // this.videoLinks = videoLinks;
    // this.videoTitles = videoTitles;
    this.instructorFirstName = instructorFirstName;
    this.Title = Title;
    // this.total = videoTitles.length;
    // this.Thevideo=videoLinks[0];
    this.Photolink= Photolink;
    this.AudioLink=AudioLink;


     
  
  }

   

  @override
  State<Coursepage> createState() => _CoursepageState();
}

class _CoursepageState extends State<Coursepage> {
  // _CoursepageState(instructorFirstName){
  //   instructorFirstName= super.instructorFirstName;
  // }
  late final PodPlayerController controller;
 
  List Links=[];
  int _currentIndex = 0;
   bool _play = false;
   
   
   

 
 
  

// Coursepage audioPlayer =Coursepage();



// TThese are the Set states of the Pod Player plugin
@override
  void initState() {
    // controller = PodPlayerController(
    //   playVideoFrom: PlayVideoFrom.network(
    //      widget.videoLinks[_currentIndex ],
    //   ),
    //   podPlayerConfig: const PodPlayerConfig(
    //       autoPlay: true,
    //       isLooping: false,
    //       videoQualityPriority: [1080,720,360]
    //     )
    // )..initialise();
    // super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  Widget theTiles(String title, String sub, IconData icon,
      List<dynamic> videoTitles, List<dynamic> videoLinks) {
    return ListView.builder(
        itemCount: videoTitles.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                  trailing:
                      Icon(icon, color: const Color.fromARGB(255, 241, 153, 55)),
                  focusColor: const Color.fromARGB(255, 241, 153, 55),
                  title: Text(videoTitles[index],
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  subtitle: Text(sub,
                      style: const TextStyle(fontSize: 20.0, color: Colors.white)),
                  tileColor: const Color.fromARGB(255, 36, 36, 36),
                  onTap: () {


controller.changeVideo(
                playVideoFrom:PlayVideoFrom.network(
         widget.videoLinks[index],
      ),);

                  }),
              Container(
                height: 5.0, 
                color: Colors.black)
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

     final ConcatenatingAudioSource _playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(Uri.parse(widget.AudioLink),
        tag: MediaItem(
            id: '1', artUri: Uri.parse(widget.Photolink), title:widget.instructorFirstName, album: widget.Title))
  ]); 

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Course'),
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/');
                
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [

Container(
                height: 200,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 89, 89, 89),
                    Color.fromARGB(255, 89, 89, 89)
                  ],
                )),
                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                 
                  children: [
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                     
                      children: [
                        Expanded(
                          child: Container(
                            height: 380,
                            width: 355,
                                   decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.Photolink),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,))
  //                           AudioWidget.assets(
  //    path: "https://firebasestorage.googleapis.com/v0/b/my-ideas-2fde6.appspot.com/o/file%2FFall%20away%20-%20The%20Fray.mp3?alt=media&token=d7baadb7-c3ca-4c64-8796-2098462ce698",
  //    play: _play,
  //    child:ElevatedButton(
  //          child: Text(
  //              _play ? "pause" : "play",
  //          ),
  //          onPressed: () {
  //              setState(() {
  //                _play = !_play;
  //              });
  //          }
  //     ),
  //     onReadyToPlay: (duration) {
  //         //onReadyToPlay
  //     },
  //     onPositionChanged: (current, duration) {
  //         //onPositionChanged
  //     },
  // )

                          ),
                        ),
     
                      ],
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.black,
                    child: Center(
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Text(widget.instructorFirstName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.white));
                          }),
                    ),
                  ),
                )
              ]),

              //Title of ther course
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.black,
                      child: Center(
                          child: Text(widget.Title,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))),
                )
              ]),
              Container(
                color: Colors.black,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.black,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 241, 153, 55)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                  child: BasicAudioPlayer(playlist: _playlist),
                ),
                            ),
                          ),
                        ),
                      ),
                      
                    ]),
              ),
              Container(
                color: const Color.fromRGBO(0, 0, 0, 1),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            //'${widget.total} 
                          'lessons',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 241, 153, 55),
                            ),
                          ),
                        ),
                        const Text('1h 15m',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 241, 153, 55)))
                      ]),
                ),
              ),
  
              // theTiles('1.What is Leadrship', '2:09', Icons.done, widget.videoTitles,
              //     widget.videoLinks),
            ]),
          )),
    );
  }
}
