import 'package:flutter/material.dart';
import 'package:my_ideas_today/chewie_list_item.dart';
import 'package:video_player/video_player.dart';
import 'package:pod_player/pod_player.dart';


class Coursepage extends StatefulWidget {
  //final String video;
  late final int total;
  // final String Title;
  List<dynamic> videoLinks = [];
  List<dynamic> videoTitles = [];
  String instructorFirstName='';
  String Title='';
  String Thevideo='';
  Coursepage(
    /*this.video, this.Author, this.Title, */
    List<dynamic> videoLinks,
    List<dynamic> videoTitles,
    String instructorFirstName,
     String Title,
  ) {
    this.videoLinks = videoLinks;
    this.videoTitles = videoTitles;
    this.instructorFirstName = instructorFirstName;
    this.Title = Title;
    this.total = videoTitles.length;
    this.Thevideo=videoLinks[0];
  }

  @override
  State<Coursepage> createState() => _CoursepageState();
}

class _CoursepageState extends State<Coursepage> {
  late final PodPlayerController controller;
  List Links=[];
  int _currentIndex = 0;
 //final ChewieListItemState chewielist = ChewieListItem(videoPlayerController: videoPlayerController, looping: looping, currentIndex: currentIndex)
  
  get _chewieController => null;
  set Thevideo(Thevideo) {}




// TThese are the Set states of the Pod Player plugin
@override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
         widget.videoLinks[_currentIndex ],
      ),
      podPlayerConfig: const PodPlayerConfig(
          autoPlay: true,
          isLooping: false,
          videoQualityPriority: [1080,720,360]
        )
    )..initialise();
    super.initState();
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
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                  trailing:
                      Icon(icon, color: Color.fromARGB(255, 241, 153, 55)),
                  focusColor: Color.fromARGB(255, 241, 153, 55),
                  title: Text(videoTitles[index],
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  subtitle: Text(sub,
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  tileColor: Color.fromARGB(255, 36, 36, 36),
                  onTap: () {


controller.changeVideo(
                playVideoFrom:PlayVideoFrom.network(
         widget.videoLinks[index],
      ),);


  //                     ChewieListItem(
  //                             videoPlayerController: VideoPlayerController.network(
  //                               widget.videoLinks[index],
  //                             ),
  //                             looping: true,
  //                           );

  //                           setState(() {
  //    _currentIndex =index;
  //  });
  // VideoPlayerController
  //The previous Chewie Stuff

  //       ChewieListItem( videoPlayerController: VideoPlayerController.network(
  //                            widget.videoLinks[index],
                             
  //                            ),looping:true,currentIndex:index);
  // ChewieListItemState().playVideo( index:index);
//Finishes Here


                    // launch(_emailLaunchUri.toString());
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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Course'),
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [

Container(
                height: 200,
                decoration: BoxDecoration(
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
                            child: PodVideoPlayer(controller: controller)
                            //  ChewieListItem(
                            //   videoPlayerController: VideoPlayerController.network(
                            //     widget.videoLinks[_currentIndex ]
                            //   ),
                            //   looping: true,
                            //   currentIndex: _currentIndex,
                            //  // _currentIndex
                            // ),
                          ),
                        ),
                        /*CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.play_arrow,
                            color: Color.fromARGB(255, 89, 89, 89),
                          ),
                          radius: 14.0,
                        ),
                        */
                      ],
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.black,
                    child: Center(
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Text(widget.instructorFirstName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                      padding: EdgeInsets.all(20),
                      color: Colors.black,
                      child: Center(
                          child: Text(widget.Title,
                              style: TextStyle(
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
                          padding: EdgeInsets.all(20),
                          color: Colors.black,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 241, 153, 55)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'PLAY LESSON 1',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.bookmarks,
                        color: Color.fromARGB(255, 241, 153, 55),
                      )
                    ]),
              ),
              Container(
                color: Color.fromRGBO(0, 0, 0, 1),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.total} lessons',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 241, 153, 55),
                            ),
                          ),
                        ),
                        Text('1h 15m',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 241, 153, 55)))
                      ]),
                ),
              ),
  
              theTiles('1.What is Leadrship', '2:09', Icons.done, widget.videoTitles,
                  widget.videoLinks),
            ]),
          )),
    );
  }
}
