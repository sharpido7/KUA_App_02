import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final int currentIndex;




  ChewieListItem({
    //@required this.videoPlayerController,
    required this.videoPlayerController,
    // this.looping,
    required this.looping,
    required this.currentIndex,


    //Key key
    key,
  }) : super(key: key);


  @override
  ChewieListItemState createState() => ChewieListItemState();
}

class ChewieListItemState extends State<ChewieListItem> {
  //ChewieController _chewieController;
  late ChewieController _chewieController=ChewieController(
  videoPlayerController: widget.videoPlayerController,
  autoPlay: true,
  looping: true,
);
  

void playVideo({ int index=0,bool init=false}){
  if (index< 0 ) return;
  //_chewieController= widget.videoPlayerController;
 if(!init){
  _chewieController.pause();
 }
 
 widget.videoPlayerController..addListener(()=> setState(() {
     
   }))..initialize().then((value)=> _chewieController.play());

}
  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: false,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
