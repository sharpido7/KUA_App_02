import 'package:easy_audio_player/helpers/init_just_audio_background.dart';
import 'package:easy_audio_player/models/models.dart';
import 'package:easy_audio_player/widgets/players/basic_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ConcatenatingAudioSource _playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(Uri.parse('https://firebasestorage.googleapis.com/v0/b/my-ideas-2fde6.appspot.com/o/file%2FFall%20away%20-%20The%20Fray.mp3?alt=media&token=d7baadb7-c3ca-4c64-8796-2098462ce698'),
        tag: MediaItem(
            id: '1', artUri: Uri.parse('https://firebasestorage.googleapis.com/v0/b/my-ideas-2fde6.appspot.com/o/test%2FIMG-20220704-WA0016.jpg?alt=media&token=ff91ea72-9bd8-4e8f-8c36-cf9424a8918c'), title: 'Jokate Mwigelo ', album: 'Leadership'))
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: BasicAudioPlayer(playlist: _playlist),
                )
                )));
  }
}