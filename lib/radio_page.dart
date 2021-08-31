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
import 'package:http/http.dart' as http;

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
  bool flag = false;

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
          r[index].url)));
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
  String data = "عبدالباسط عبدالصمد1";
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
                margin: EdgeInsets.only(right: 10,top:20,bottom: 30),
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
              Container(child:Center(child: Text(data))),
              Container(
                  //padding: EdgeInsets.only(right: 25),
                  margin: EdgeInsets.only(top: 20),child:Row(

                   children: [
                     Expanded(
                         child:IconButton(icon: provider.isDarkModeEnable()? Image.asset("assets/nextDark.png"): Image.asset("assets/500.png")
                          ,onPressed: () {
                          index++;
                          setState(() {
                            data = r[index].name;
                          });
                          _player.setAudioSource(AudioSource.uri(Uri.parse(
                              r[index].url)));

                    },iconSize: 100,)),
                     Expanded(
                         child:IconButton(icon:  provider.isDarkModeEnable()? Image.asset("assets/playDark.png"):Image.asset("assets/play.png")
                       ,onPressed: () {
                           if(flag == false) {
                             _player.play();
                             flag = !flag;
                           }
                           else {
                             _player.pause();
                             flag = !flag;
                           }
                       },iconSize: 100,)),
                     Expanded(
                       child: IconButton(icon:  provider.isDarkModeEnable()? Image.asset("assets/preDark.png"):Image.asset("assets/previos1.png")
                         ,onPressed: () {
                         index--;
                         setState(() {
                             data = r[index].name;
                           });
                         _player.setAudioSource(AudioSource.uri(Uri.parse(
                             r[index].url)));
                       },iconSize: 100,),
                     ),

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



      List<radio> r = [
      new radio("عبدالباسط عبدالصمد1",
          "http://live.mp3quran.net:9980/"
      ),
      new radio("عبدالباسط عبدالصمد2 ",
          "http://live.mp3quran.net:9974/"
      ),
      new radio("عبدالباسط عبدالصمد3",
          "http://live.mp3quran.net:9956/"
      ),
      new radio("محمد صديق المنشاوي1",
          "http://live.mp3quran.net:9826/"
      ),
      new radio("محمد صديق المنشاوي2",
          "http://live.mp3quran.net:9978/"
      ),
      new radio("محمود خليل الحصري1",
          "http://live.mp3quran.net:9958/"
      ),
      new radio("محمود خليل الحصري2",
          "http://live.mp3quran.net:9806/"
      ),
      new radio("محمود خليل الحصري3",
          "http://live.mp3quran.net:9804/"
      ),
      new radio("محمود علي البنا1",
          "http://live.mp3quran.net:9808/"
      ),
      new radio("محمود علي البنا2",
          "http://live.mp3quran.net:9810/"
      ),
      new radio("مشاري العفاسي",
          "http://live.mp3quran.net:8010/"
      ),
      new radio("مصطفى إسماعيل",
          "http://live.mp3quran.net:9800/"
      ),
      new radio("---تراتيل قصيرة متميزة---",
      "http://live.mp3quran.net:9702/"
      ),
      new radio("--تفسير القران الكريم--",
      "http://live.mp3quran.net:9718/"
      ),
      new radio("--سورة البقرة - لعدد من القراء",
      "http://live.mp3quran.net:9722/"
      ),
      new radio("-الإذاعة العامة - اذاعة متنوعة لمختلف القراء",
      "http://live.mp3quran.net:8006/"
      ),
      new radio("-المختصر في تفسير القرآن الكريم-",
      "http://live.mp3quran.net:9698/"
      ),
      new radio("-تلاوات خاشعة-",
      "http://live.mp3quran.net:9992/"
      ),
      new radio("أحمد الحواشي",
      "http://live.mp3quran.net:9928/"
      ),
      new radio("أحمد الطرابلسي",
      "http://live.mp3quran.net:9926/"
      ),
      new radio("أحمد بن علي العجمي",
      "http://live.mp3quran.net:8008/"
      ),
      new radio("أحمد خضر الطرابلسي",
      "http://live.mp3quran.net:9924/"
      ),
      new radio("أحمد ديبان",
      "http://live.mp3quran.net:8024/"
      ),
      new radio("أحمد صابر",
      "http://live.mp3quran.net:9922/"
      ),
      new radio("أحمد عامر",
      "http://live.mp3quran.net:9920/"
      ),
      new radio("أحمد نعينع",
      "http://live.mp3quran.net:9904/"
      ),
      new radio("أكرم العلاقمي",
      "http://live.mp3quran.net:9918/"
      ),
      new radio("إبراهيم الأخضر",
      "http://live.mp3quran.net:9946/"
      ),
      new radio("إدريس أبكر",
      "http://live.mp3quran.net:9968/"
      ),
      new radio("ابراهيم الدوسري",
      "http://live.mp3quran.net:9902/"
      ),
      new radio("الدوكالي محمد العالم",
      "http://live.mp3quran.net:9916/"
      ),
      new radio("الرقية الشرعية",
      "http://live.mp3quran.net:9936/"
      ),
      new radio("الزين محمد أحمد",
      "http://live.mp3quran.net:9914/"
      ),
      new radio("العيون الكوشي",
      "http://live.mp3quran.net:9912/"
      ),
      new radio("الفاتح محمد الزبير",
      "http://live.mp3quran.net:9910/"
      ),
      new radio("الفتاوى",
      "http://live.mp3quran.net:8014/"
      ),
      new radio("القارئ ياسين",
      "http://live.mp3quran.net:9908/"
      ),
      new radio("تكبيرات العيد",
      "http://live.mp3quran.net:9728/"
      ),
      new radio("توفيق الصايغ",
      "http://live.mp3quran.net:9906/"
      ),
      new radio("جمال شاكر عبدالله",
      "http://live.mp3quran.net:9900/"
      ),
      new radio("جمعان العصيمي",
      "http://live.mp3quran.net:9950/"
      ),
      new radio("حاتم فريد الواعر",
      "http://live.mp3quran.net:9898/"
      ),
      new radio("خالد الجليل",
      "http://live.mp3quran.net:9708/"
      ),
      new radio("خالد القحطاني",
      "http://live.mp3quran.net:9970/"
      ),
      new radio("خالد المهنا",
      "http://live.mp3quran.net:9896/"
      ),
      new radio("خالد عبدالكافي",
      "http://live.mp3quran.net:9894/"
      ),
      new radio("خليفة الطنيجي",
      "http://live.mp3quran.net:9892/"
      ),
      new radio("زكي داغستاني",
      "http://live.mp3quran.net:9890/"
      ),
      new radio("سعد الغامدي",
      "http://live.mp3quran.net:8004/"
      ),
      new radio("سعود الشريم",
      "http://live.mp3quran.net:9986/"
      ),
      new radio("سهل ياسين",
      "http://live.mp3quran.net:9888/"
      ),
      new radio("سيد رمضان",
      "http://live.mp3quran.net:9886/"
      ),
      new radio("شيخ أبو بكر الشاطري",
      "http://live.mp3quran.net:9966/"
      ),
      new radio("شيرزاد عبدالرحمن طاهر",
      "http://live.mp3quran.net:9884/"
      ),
      new radio("صابر عبدالحكم",
      "http://live.mp3quran.net:9952/"
      ),
      new radio("صالح الهبدان",
      "http://live.mp3quran.net:8026/"
      ),
      new radio("صلاح البدير",
      "http://live.mp3quran.net:9882/"
      ),
      new radio("صلاح الهاشم",
      "http://live.mp3quran.net:9880/"
      ),
      new radio("صلاح بو خاطر",
      "http://live.mp3quran.net:9878/"
      ),
      new radio("طارق عبدالغني دعوب",
      "http://live.mp3quran.net:9876/"
      ),
      new radio("عادل الكلباني",
      "http://live.mp3quran.net:9874/"
      ),
      new radio("عادل ريان",
      "http://live.mp3quran.net:9872/"
      ),
      new radio("عبدالبارئ الثبيتي",
      "http://live.mp3quran.net:9870/"
      ),
      new radio("عبدالبارئ محمد",
      "http://live.mp3quran.net:9868/"
      ),
      new radio("عبدالرحمن السديس",
      "http://live.mp3quran.net:9988/"
      ),
      new radio("عبدالرحمن الماجد",
      "http://live.mp3quran.net:9726/"
      ),
      new radio("عبدالرشيد صوفي",
      "http://live.mp3quran.net:9866/"
      ),
      new radio("عبدالرشيد صوفي",
      "http://live.mp3quran.net:9864/"
      ),
      new radio("عبدالعزيز الأحمد",
      "http://live.mp3quran.net:9862/"
      ),
      new radio("عبدالله الخلف",
      "http://live.mp3quran.net:9704/"
      ),
      new radio("عبدالله الكندري",
      "http://live.mp3quran.net:9860/"
      ),
      new radio("عبدالله المطرود",
      "http://live.mp3quran.net:9858/"
      ),
      new radio("عبدالله الموسى",
      "http://live.mp3quran.net:9706/"
      ),
      new radio("عبدالله بصفر",
      "http://live.mp3quran.net:9954/"
      ),
      new radio("عبدالله خياط",
      "http://live.mp3quran.net:9948/"
      ),
      new radio("عبدالله عواد الجهني",
      "http://live.mp3quran.net:9944/"
      ),
      new radio("عبدالمحسن الحارثي",
      "http://live.mp3quran.net:9856/"
      ),
      new radio("عبدالمحسن العبيكان",
      "http://live.mp3quran.net:9854/"
      ),
      new radio("عبدالمحسن القاسم",
      "http://live.mp3quran.net:9852/"
      ),
      new radio("عبدالهادي أحمد كناكري",
      "http://live.mp3quran.net:9850/"
      ),
      new radio("عبدالودود حنيف",
      "http://live.mp3quran.net:9848/"
      ),
      new radio("علي الحذيفي",
      "http://live.mp3quran.net:9844/"
      ),
      new radio("علي الحذيفي",
      "http://live.mp3quran.net:9846/"
      ),
      new radio("علي جابر",
      "http://live.mp3quran.net:9964/"
      ),
      new radio("علي حجاج السويسي",
      "http://live.mp3quran.net:9842/"
      ),
      new radio("عماد زهير حافظ",
      "http://live.mp3quran.net:9840/"
      ),
      new radio("عمر القزابري",
      "http://live.mp3quran.net:9838/"
      ),
      new radio("فارس عباد",
      "http://live.mp3quran.net:9972/"
      ),
      new radio("ماجد الزامل",
      "http://live.mp3quran.net:8022/"
      ),
      new radio("ماهر المعيقلي",
      "http://live.mp3quran.net:8002/"
      ),
      new radio("ماهر شخاشيرو",
      "http://live.mp3quran.net:9836/"
      ),
      new radio("محمد أيوب",
      "http://live.mp3quran.net:9960/"
      ),
      new radio("محمد أيوب - قراءة متميزة--",
      "http://live.mp3quran.net:9700/"
      ),
      new radio("محمد الطبلاوي",
      "http://live.mp3quran.net:9834/"
      ),
      new radio("محمد اللحيدان",
      "http://live.mp3quran.net:9832/"
      ),
      new radio("محمد جبريل",
      "http://live.mp3quran.net:9962/"
      ),
      new radio("محمد رشاد الشريف",
      "http://live.mp3quran.net:9830/"
      ),
      new radio("محمد صالح عالم شاه",
      "http://live.mp3quran.net:9828/"
      ),
      new radio("محمد عبدالحكيم سعيد العبدالله",
      "http://live.mp3quran.net:9814/"
      ),
      new radio("محمد عبدالحكيم سعيد العبدالله",
      "http://live.mp3quran.net:9816/"
      ),
      new radio("محمد عبدالكريم",
      "http://live.mp3quran.net:9822/"
      ),
      new radio("محمد عبدالكريم",
      "http://live.mp3quran.net:9824/"
      ),
      new radio("محمد عثمان خان ( من الهند )",
      "http://live.mp3quran.net:9820/"
      ),
      new radio("محمود الرفاعي",
      "http://live.mp3quran.net:9818/"
      ),
      new radio("محمود الشيمي",
      "http://live.mp3quran.net:9812/"
      ),
      new radio("مصطفى اللاهوني",
      "http://live.mp3quran.net:9798/"
      ),
      new radio("مصطفى رعد العزاوي",
      "http://live.mp3quran.net:9796/"
      ),
      new radio("معيض الحارثي",
      "http://live.mp3quran.net:9802/"
      ),
      new radio("مفتاح السلطني",
      "http://live.mp3quran.net:9792/"
      ),
      new radio("مفتاح السلطني",
      "http://live.mp3quran.net:9794/"
      ),
      new radio("مفتاح السلطني",
      "http://live.mp3quran.net:9788/"
      ),
      new radio("مفتاح السلطني",
      "http://live.mp3quran.net:9790/"
      ),
      new radio("موسى بلال",
      "http://live.mp3quran.net:9786/"
      ),
      new radio("ناصر العصفور",
      "http://live.mp3quran.net:8020/"
      ),
      new radio("ناصر القطامي",
      "http://live.mp3quran.net:9994/"
      ),
      new radio("ناصر الماجد",
      "http://live.mp3quran.net:9712/"
      ),
      new radio("نبيل الرفاعي",
      "http://live.mp3quran.net:9784/"
      ),
      new radio("نعمة الحسان",
      "http://live.mp3quran.net:9782/"
      ),
      new radio("هاني الرفاعي",
      "http://live.mp3quran.net:9780/"
      ),
      new radio("هيثم الجدعاني",
      "http://live.mp3quran.net:9714/"
      ),
      new radio("وليد النائحي",
      "http://live.mp3quran.net:9778/"
      ),
      new radio("ياسر الدوسري",
      "http://live.mp3quran.net:9984/"
      ),
      new radio("ياسر القرشي",
      "http://live.mp3quran.net:9776/"
      ),
      new radio("ياسر المزروعي ",
      "http://live.mp3quran.net:9774/"
      ),
      new radio("يحيى حوا",
      "http://live.mp3quran.net:9772/"
      ),
      new radio("يوسف الشويعي",
      "http://live.mp3quran.net:9770/"
      ),
      new radio("يوسف بن نوح أحمد",
      "http://live.mp3quran.net:9768/"
      )];
}
class radio{
  late String name;
  late String url;

  radio(this.name, this.url);
}


