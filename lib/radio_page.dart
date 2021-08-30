import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'common.dart';
import 'package:rxdart/rxdart.dart';

import 'package:provider/provider.dart';

import 'AppConfigProvider.dart';

class RadioChannel extends StatefulWidget {

  RadioChannel();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioChannel();
  }
}

class _RadioChannel extends State< RadioChannel> with WidgetsBindingObserver {
      int index=0;

  _RadioChannel();

  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          s[index])));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  late  AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);

    // TODO: implement build
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(

            image: provider.isDarkModeEnable()?AssetImage("assets/bg.png"):AssetImage("assets/bg3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children:[
              Container(
                margin: EdgeInsets.only(right: 10,top:4,bottom: 30),
                child:
                Center(
                  child:Text(AppLocalizations.of(context)!.islamy,
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Container(margin: EdgeInsets.only(top: 60),child:  Image.asset("assets/radio_image.png")

                    )
                    ],
                  )

              ),
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 4),
                child:Text(AppLocalizations.of(context)!.quranradio,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
              Container(
                  padding: EdgeInsets.only(right: 25),
                  margin: EdgeInsets.only(top: 20),child:Row(

                   children: [
                        IconButton(icon: provider.isDarkModeEnable()? Image.asset("assets/nextDark.png"): Image.asset("assets/500.png")
                          ,onPressed: () {
                          index++;
                          _player.setAudioSource(AudioSource.uri(Uri.parse(
                              s[index])));

                    },iconSize: 100,),
                     IconButton(icon:  provider.isDarkModeEnable()? Image.asset("assets/playDark.png"):Image.asset("assets/play.png")
                       ,onPressed: () {
                         _player.play();
                       },iconSize: 100,),
                     IconButton(icon:  provider.isDarkModeEnable()? Image.asset("assets/preDark.png"):Image.asset("assets/previos1.png")
                       ,onPressed: () {
                       index--;
                       _player.setAudioSource(AudioSource.uri(Uri.parse(
                           s[index])));
                     },iconSize: 100,),
                  ],
                ))


            ]
        ),
      ),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }



  List<String> s = ["http://live.mp3quran.net:9702/"
                   ,"http://live.mp3quran.net:9718/"
                   ,"http://live.mp3quran.net:9992/"];



}


