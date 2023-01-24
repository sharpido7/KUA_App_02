import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  // late BetterPlayerController _betterPlayerController;

  // @override
  // void initState() {
  //   super.initState();
  //   BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network,
  //       "https://www.youtube.com/watch?v=LOW1yuKE-_o");
  //   _betterPlayerController = BetterPlayerController(
  //       BetterPlayerConfiguration(),
  //       betterPlayerDataSource: betterPlayerDataSource);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
   
        title: const Text('Video Player'),
      ),
body:  AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}