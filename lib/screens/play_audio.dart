import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '../brain/page_Manager.dart';
import '../components/sign_in_button.dart';
import '../constants.dart';



class PlayAudio extends StatefulWidget {
 const PlayAudio({Key? key}) : super(key: key);

  @override
  _PlayAudioState createState() => _PlayAudioState();
}




class _PlayAudioState extends State<PlayAudio> {


  late final PageManager _pageManager;

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;

  Color kPurpleColour = Colors.deepPurple;




  @override
  void initState() {
 _pageManager = PageManager("assets/breakfast_audio.mp3");
    super.initState();
  }



  @override
  void dispose() {
    _pageManager.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          toolbarHeight: 30.0,
          backgroundColor: kWhiteColour,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.deepPurple,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [



                  const Text("Breakfast Audio"),


                  SizedBox(height: 30,),


                  ValueListenableBuilder<ProgressBarState>(
                    valueListenable: _pageManager.progressNotifier,
                    builder: (_, value, __) {

                      return ProgressBar(
                        progressBarColor: kPurpleColour,
                        baseBarColor: Colors.grey.shade700,
                        thumbColor: kPurpleColour,
                        progress: value.current,
                        buffered: value.buffered,
                        total: value.total,
                        onSeek: _pageManager.seek,
                      );
                    },
                  ),

                  ValueListenableBuilder<ButtonState>(
                    valueListenable: _pageManager.buttonNotifier,
                    builder: (_, value, __) {
                      switch (value) {
                        case ButtonState.loading:
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            width: 32.0,
                            height: 32.0,
                            child: const CircularProgressIndicator(),
                          );
                        case ButtonState.paused:
                          return CircleAvatar(
                            backgroundColor: kPurpleColour,
                            radius: 35,
                            child: IconButton(
                              icon: const Icon(Icons.play_arrow, color: kWhiteColour,),
                              iconSize: 50.0,
                              onPressed: _pageManager.play,
                            ),
                          );
                        case ButtonState.playing:
                          return CircleAvatar(
                            backgroundColor: kPurpleColour,
                            radius: 35,
                            child: IconButton(
                              icon: const Icon(Icons.pause, color: kWhiteColour,),
                              iconSize: 50.0,
                              onPressed: _pageManager.pause,
                            ),
                          );
                      }
                    },
                  ),


                ]
            ),
          ),
        ));
  }
}
