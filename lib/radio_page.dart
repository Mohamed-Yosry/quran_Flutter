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
      List<Radio> en = [
        new Radio("Abdulbasit Abdulsamad1",
            "http://live.mp3quran.net:9980/"),
        new Radio("Abdulbasit Abdulsamad2",
            "http://live.mp3quran.net:9974/"),
        new Radio("Abdulbasit Abdulsamad3",
            "http://live.mp3quran.net:9956/"),
        new Radio("Abdulhadi Kanakeri1",
            "http://live.mp3quran.net:9850/"),
        new Radio("Mohammed Siddiq Al-Minshawi1",
            "http://live.mp3quran.net:9826/"),
        new Radio("Mohammed Siddiq Al-Minshawi2",
            "http://live.mp3quran.net:9978/"),
        new Radio("Mohammed Siddiq Al-Minshawi3",
            "http://live.mp3quran.net:9826/"),
        new Radio("Mahmoud Khalil Al-Hussary",
            "http://live.mp3quran.net:9806/"),
        new Radio("Mahmoud Khalil Al-Hussary",
            "http://live.mp3quran.net:9804/"),
        new Radio("Mahmoud Khalil Al-Hussary",
            "http://live.mp3quran.net:9958/"),
        new Radio("Mahmoud Ali  Albanna",
            "http://live.mp3quran.net:9810/"),
        new Radio("Mahmoud Ali  Albanna",
            "http://live.mp3quran.net:9808/"),
        new Radio("---Amazing short Recitations---",
            "http://live.mp3quran.net:9702/"),
        new Radio("--Quran Tafseer--",
            "http://live.mp3quran.net:9718/"),
        new Radio("-Beautiful Recitations-",
            "http://live.mp3quran.net:9992/"),
        new Radio("-Main Radio-",
            "http://live.mp3quran.net:8006/"),
        new Radio("-Quran Tafseer(Almukhtasar Fi Altafsir)-",
            "http://live.mp3quran.net:9698/"),
        new Radio("-Surah Al-Baqarah - Many Reciters",
            "http://live.mp3quran.net:9722/"),
        new Radio("Abdelbari Al-Toubayti",
            "http://live.mp3quran.net:9870/"),
        new Radio("Abdul Aziz Al-Ahmad",
            "http://live.mp3quran.net:9862/"),
        new Radio("Abdulbari Mohammad",
            "http://live.mp3quran.net:9868/"),
        new Radio("Abdullah Al-Johany",
            "http://live.mp3quran.net:9944/"),
        new Radio("Abdullah Al-Kandari",
            "http://live.mp3quran.net:9860/"),
        new Radio("Abdullah Al-Khalaf",
            "http://live.mp3quran.net:9704/"),
        new Radio("Abdullah Al-Mattrod",
            "http://live.mp3quran.net:9858/"),
        new Radio("Abdullah Al-Mousa",
            "http://live.mp3quran.net:9706/"),
        new Radio("Abdullah Basfer",
            "http://live.mp3quran.net:9954/"),
        new Radio("Abdullah Khayyat",
            "http://live.mp3quran.net:9948/"),
        new Radio("Abdulmohsen Al-Qasim",
            "http://live.mp3quran.net:9852/"),
        new Radio("Abdulmohsin Al-Harthy",
            "http://live.mp3quran.net:9856/"),
        new Radio("Abdulmohsin Al-Obaikan",
            "http://live.mp3quran.net:9854/"),
        new Radio("Abdulrahman Al-Majed",
            "http://live.mp3quran.net:9726/"),
        new Radio("Abdulrahman Alsudaes",
            "http://live.mp3quran.net:9988/"),
        new Radio("Abdulrasheed Soufi",
            "http://live.mp3quran.net:9864/"),
        new Radio("Abdulrasheed Soufi",
            "http://live.mp3quran.net:9866/"),
        new Radio("Abdulwadood Haneef",
            "http://live.mp3quran.net:9848/"),
        new Radio("Addokali Mohammad Alalim",
            "http://live.mp3quran.net:9916/"),
        new Radio("Adel Al-Khalbany",
            "http://live.mp3quran.net:9874/"),
        new Radio("Adel Ryyan",
            "http://live.mp3quran.net:9872/"),
        new Radio("Ahmad Al-Ajmy",
            "http://live.mp3quran.net:8008/"),
        new Radio("Ahmad Al-Hawashi",
            "http://live.mp3quran.net:9928/"),
        new Radio("Ahmad Deban",
            "http://live.mp3quran.net:8024/"),
        new Radio("Ahmad Khader Al-Tarabulsi",
            "http://live.mp3quran.net:9924/"),
        new Radio("Ahmad Nauina",
            "http://live.mp3quran.net:9904/"),
        new Radio("Ahmad Saber",
            "http://live.mp3quran.net:9922/"),
        new Radio("Ahmed Al-trabulsi",
            "http://live.mp3quran.net:9926/"),
        new Radio("Ahmed Amer",
            "http://live.mp3quran.net:9920/"),
        new Radio("Akram Alalaqmi",
            "http://live.mp3quran.net:9918/"),
        new Radio("Al-Qaria Yassen",
            "http://live.mp3quran.net:9908/"),
        new Radio("Alfateh Alzubair",
            "http://live.mp3quran.net:9910/"),
        new Radio("Ali Alhuthaifi",
            "http://live.mp3quran.net:9846/"),
        new Radio("Ali Alhuthaifi",
            "http://live.mp3quran.net:9844/"),
        new Radio("Ali Hajjaj Alsouasi",
            "http://live.mp3quran.net:9842/"),
        new Radio("Ali Jaber",
            "http://live.mp3quran.net:9964/"),
        new Radio("Aloyoon Al-Koshi",
            "http://live.mp3quran.net:9912/"),
        new Radio("Alzain Mohammad Ahmad",
            "http://live.mp3quran.net:9914/"),
        new Radio("EID's TAKBEER",
            "http://live.mp3quran.net:9728/"),
        new Radio("Emad Hafez",
            "http://live.mp3quran.net:9840/"),
        new Radio("Fares Abbad",
            "http://live.mp3quran.net:9972/"),
        new Radio("FATAWA",
            "http://live.mp3quran.net:8014/"),
        new Radio("Hani Arrifai",
            "http://live.mp3quran.net:9780/"),
        new Radio("Hatem Fareed Alwaer",
            "http://live.mp3quran.net:9898/"),
        new Radio("Hitham Aljadani",
            "http://live.mp3quran.net:9714/"),
        new Radio("Ibrahim Al-Akdar",
            "http://live.mp3quran.net:9946/"),
        new Radio("Ibrahim Aldosari",
            "http://live.mp3quran.net:9902/"),
        new Radio("Idrees Abkr",
            "http://live.mp3quran.net:9968/"),
        new Radio("Jamaan Alosaimi",
            "http://live.mp3quran.net:9950/"),
        new Radio("Jamal Shaker Abdullah",
            "http://live.mp3quran.net:9900/"),
        new Radio("Khaled Al-Qahtani",
            "http://live.mp3quran.net:9970/"),
        new Radio("Khalid Abdulkafi",
            "http://live.mp3quran.net:9894/"),
        new Radio("Khalid Al-Jileel",
            "http://live.mp3quran.net:9708/"),
        new Radio("Khalid Almohana",
            "http://live.mp3quran.net:9896/"),
        new Radio("Khalifa Altunaiji",
            "http://live.mp3quran.net:9892/"),
        new Radio("Maher Al Meaqli",
            "http://live.mp3quran.net:8002/"),
        new Radio("Maher Shakhashero",
            "http://live.mp3quran.net:9836/"),
        new Radio("Mahmood Al rifai",
            "http://live.mp3quran.net:9818/"),
        new Radio("Mahmood AlSheimy",
            "http://live.mp3quran.net:9812/"),
        new Radio("Majed Al-Zamil",
            "http://live.mp3quran.net:8022/"),
        new Radio("Mishary Alafasi",
            "http://live.mp3quran.net:8010/"),
        new Radio("Moeedh Alharthi",
            "http://live.mp3quran.net:9802/"),
        new Radio("Mohammad Abdullkarem",
            "http://live.mp3quran.net:9822/"),
        new Radio("Mohammad Abdullkarem",
            "http://live.mp3quran.net:9824/"),
        new Radio("Mohammad Al-Abdullah",
            "http://live.mp3quran.net:9816/"),
        new Radio("Mohammad Al-Abdullah",
            "http://live.mp3quran.net:9814/"),
        new Radio("Mohammad Al-Tablaway",
            "http://live.mp3quran.net:9834/"),
        new Radio("Mohammad Rashad Alshareef",
            "http://live.mp3quran.net:9830/"),
        new Radio("Mohammad Saleh Alim Shah",
            "http://live.mp3quran.net:9828/"),
        new Radio("Mohammed Al-Lohaidan",
            "http://live.mp3quran.net:9832/"),
        new Radio("Mohammed Ayyub",
            "http://live.mp3quran.net:9960/"),
        new Radio("Mohammed Ayyub - Amazing Recitations",
            "http://live.mp3quran.net:9700/"),
        new Radio("Mohammed Jibreel",
            "http://live.mp3quran.net:9962/"),
        new Radio("Mohammed Osman Khan (from India)",
            "http://live.mp3quran.net:9820/"),
        new Radio("Mousa Bilal",
            "http://live.mp3quran.net:9786/"),
        new Radio("Muftah Alsaltany",
            "http://live.mp3quran.net:9788/"),
        new Radio("Muftah Alsaltany",
            "http://live.mp3quran.net:9790/"),
        new Radio("Muftah Alsaltany",
            "http://live.mp3quran.net:9792/"),
        new Radio("Muftah Alsaltany",
            "http://live.mp3quran.net:9794/"),
        new Radio("Mustafa Al-Lahoni",
            "http://live.mp3quran.net:9798/"),
        new Radio("Mustafa Ismail",
            "http://live.mp3quran.net:9800/"),
        new Radio("Mustafa raad Alazawy",
            "http://live.mp3quran.net:9796/"),
        new Radio("Nabil Al Rifay",
            "http://live.mp3quran.net:9784/"),
        new Radio("Nasser Almajed",
            "http://live.mp3quran.net:9712/"),
        new Radio("Nasser Alosfor",
            "http://live.mp3quran.net:8020/"),
        new Radio("Nasser Alqatami",
            "http://live.mp3quran.net:9994/"),
        new Radio("Neamah Al-Hassan",
            "http://live.mp3quran.net:9782/"),
        new Radio("Omar Al-Qazabri",
            "http://live.mp3quran.net:9838/"),
        new Radio("ROQYAH",
            "http://live.mp3quran.net:9936/"),
        new Radio("Saad Al-Ghamdi",
            "http://live.mp3quran.net:8004/"),
        new Radio("Saber Abdulhakm",
            "http://live.mp3quran.net:9952/"),
        new Radio("Sahl Yassin",
            "http://live.mp3quran.net:9888/"),
        new Radio("Salah Albudair",
            "http://live.mp3quran.net:9882/"),
        new Radio("Salah Alhashim",
            "http://live.mp3quran.net:9880/"),
        new Radio("Saleh Al-Habdan",
            "http://live.mp3quran.net:8026/"),
        new Radio("Saud Al-Shuraim",
            "http://live.mp3quran.net:9986/"),
        new Radio("Sayeed Ramadan",
            "http://live.mp3quran.net:9886/"),
        new Radio("Shaik Abu Bakr Al Shatri",
            "http://live.mp3quran.net:9966/"),
        new Radio("Shirazad Taher",
            "http://live.mp3quran.net:9884/"),
        new Radio("Slaah Bukhatir",
            "http://live.mp3quran.net:9878/"),
        new Radio("Tareq Abdulgani daawob",
            "http://live.mp3quran.net:9876/"),
        new Radio("Tawfeeq As-Sayegh",
            "http://live.mp3quran.net:9906/"),
        new Radio("Waleed Alnaehi",
            "http://live.mp3quran.net:9778/"),
        new Radio("Yahya Hawwa",
            "http://live.mp3quran.net:9772/"),
        new Radio("Yasser Al-Dosari",
            "http://live.mp3quran.net:9984/"),
        new Radio("Yasser Al-Mazroyee",
            "http://live.mp3quran.net:9774/"),
        new Radio("Yasser Al-Qurashi",
            "http://live.mp3quran.net:9776/"),
        new Radio("Yousef Alshoaey",
            "http://live.mp3quran.net:9770/"),
        new Radio("Yousef Bin Noah Ahmad",
            "http://live.mp3quran.net:9768/"),
        new Radio("Zaki Daghistani",
            "http://live.mp3quran.net:9890/")];
      List<Radio> ar = [
        new Radio("عبدالباسط عبدالصمد1",
            "http://live.mp3quran.net:9980/"),
        new Radio("عبدالباسط عبدالصمد2 ",
            "http://live.mp3quran.net:9974/"),
        new Radio("عبدالباسط عبدالصمد3",
            "http://live.mp3quran.net:9956/"),
        new Radio("محمد صديق المنشاوي1",
            "http://live.mp3quran.net:9978/"),
        new Radio("محمد صديق المنشاوي2",
            "http://live.mp3quran.net:9826/"),
        new Radio("محمود خليل الحصري1",
            "http://live.mp3quran.net:9804/"),
        new Radio("محمود خليل الحصري2",
            "http://live.mp3quran.net:9958/"),
        new Radio("محمود خليل الحصري3",
            "http://live.mp3quran.net:9806/"),
        new Radio("محمود علي البنا1",
            "http://live.mp3quran.net:9808/"),
        new Radio("محمود علي البنا2",
            "http://live.mp3quran.net:9810/"),
        new Radio("مشاري العفاسي",
            "http://live.mp3quran.net:8010/"),
        new Radio("مصطفى إسماعيل",
            "http://live.mp3quran.net:9800/"),
        new Radio("---تراتيل قصيرة متميزة---",
            "http://live.mp3quran.net:9702/"),
        new Radio("--تفسير القران الكريم--",
            "http://live.mp3quran.net:9718/"),
        new Radio("--سورة البقرة - لعدد من القراء",
            "http://live.mp3quran.net:9722/"),
        new Radio("-الإذاعة العامة - اذاعة متنوعة لمختلف القراء",
            "http://live.mp3quran.net:8006/"),
        new Radio("-المختصر في تفسير القرآن الكريم-",
            "http://live.mp3quran.net:9698/"),
        new Radio("-تلاوات خاشعة-",
            "http://live.mp3quran.net:9992/"),
        new Radio("أحمد الحواشي",
            "http://live.mp3quran.net:9928/"),
        new Radio("أحمد الطرابلسي",
            "http://live.mp3quran.net:9926/"),
        new Radio("أحمد بن علي العجمي",
            "http://live.mp3quran.net:8008/"),
        new Radio("أحمد خضر الطرابلسي",
            "http://live.mp3quran.net:9924/"),
        new Radio("أحمد ديبان",
            "http://live.mp3quran.net:8024/"),
        new Radio("أحمد صابر",
            "http://live.mp3quran.net:9922/"),
        new Radio("أحمد عامر",
            "http://live.mp3quran.net:9920/"),
        new Radio("أحمد نعينع",
            "http://live.mp3quran.net:9904/"),
        new Radio("أكرم العلاقمي",
            "http://live.mp3quran.net:9918/"),
        new Radio("إبراهيم الأخضر",
            "http://live.mp3quran.net:9946/"),
        new Radio("إدريس أبكر",
            "http://live.mp3quran.net:9968/"),
        new Radio("ابراهيم الدوسري",
            "http://live.mp3quran.net:9902/"),
        new Radio("الدوكالي محمد العالم",
            "http://live.mp3quran.net:9916/"),
        new Radio("الرقية الشرعية",
            "http://live.mp3quran.net:9936/"),
        new Radio("الزين محمد أحمد",
            "http://live.mp3quran.net:9914/"),
        new Radio("العيون الكوشي",
            "http://live.mp3quran.net:9912/"),
        new Radio("الفاتح محمد الزبير",
            "http://live.mp3quran.net:9910/"),
        new Radio("الفتاوى",
            "http://live.mp3quran.net:8014/"),
        new Radio("القارئ ياسين",
            "http://live.mp3quran.net:9908/"),
        new Radio("تكبيرات العيد",
            "http://live.mp3quran.net:9728/"),
        new Radio("توفيق الصايغ",
            "http://live.mp3quran.net:9906/"),
        new Radio("جمال شاكر عبدالله",
            "http://live.mp3quran.net:9900/"),
        new Radio("جمعان العصيمي",
            "http://live.mp3quran.net:9950/"),
        new Radio("حاتم فريد الواعر",
            "http://live.mp3quran.net:9898/"),
        new Radio("خالد الجليل",
            "http://live.mp3quran.net:9708/"),
        new Radio("خالد القحطاني",
            "http://live.mp3quran.net:9970/"),
        new Radio("خالد المهنا",
            "http://live.mp3quran.net:9896/"),
        new Radio("خالد عبدالكافي",
            "http://live.mp3quran.net:9894/"),
        new Radio("خليفة الطنيجي",
            "http://live.mp3quran.net:9892/"),
        new Radio("زكي داغستاني",
            "http://live.mp3quran.net:9890/"),
        new Radio("سعد الغامدي",
            "http://live.mp3quran.net:8004/"),
        new Radio("سعود الشريم",
            "http://live.mp3quran.net:9986/"),
        new Radio("سهل ياسين",
            "http://live.mp3quran.net:9888/"),
        new Radio("سيد رمضان",
            "http://live.mp3quran.net:9886/"),
        new Radio("شيخ أبو بكر الشاطري",
            "http://live.mp3quran.net:9966/"),
        new Radio("شيرزاد عبدالرحمن طاهر",
            "http://live.mp3quran.net:9884/"),
        new Radio("صابر عبدالحكم",
            "http://live.mp3quran.net:9952/"),
        new Radio("صالح الهبدان",
            "http://live.mp3quran.net:8026/"),
        new Radio("صلاح البدير",
            "http://live.mp3quran.net:9882/"),
        new Radio("صلاح الهاشم",
            "http://live.mp3quran.net:9880/"),
        new Radio("صلاح بو خاطر",
            "http://live.mp3quran.net:9878/"),
        new Radio("طارق عبدالغني دعوب",
            "http://live.mp3quran.net:9876/"),
        new Radio("عادل الكلباني",
            "http://live.mp3quran.net:9874/"),
        new Radio("عادل ريان",
            "http://live.mp3quran.net:9872/"),
        new Radio("عبدالبارئ الثبيتي",
            "http://live.mp3quran.net:9870/"),
        new Radio("عبدالبارئ محمد",
            "http://live.mp3quran.net:9868/"),
        new Radio("عبدالرحمن السديس",
            "http://live.mp3quran.net:9988/"),
        new Radio("عبدالرحمن الماجد",
            "http://live.mp3quran.net:9726/"),
        new Radio("عبدالرشيد صوفي",
            "http://live.mp3quran.net:9866/"),
        new Radio("عبدالرشيد صوفي",
            "http://live.mp3quran.net:9864/"),
        new Radio("عبدالعزيز الأحمد",
            "http://live.mp3quran.net:9862/"),
        new Radio("عبدالله الخلف",
            "http://live.mp3quran.net:9704/"),
        new Radio("عبدالله الكندري",
            "http://live.mp3quran.net:9860/"),
        new Radio("عبدالله المطرود",
            "http://live.mp3quran.net:9858/"),
        new Radio("عبدالله الموسى",
            "http://live.mp3quran.net:9706/"),
        new Radio("عبدالله بصفر",
            "http://live.mp3quran.net:9954/"),
        new Radio("عبدالله خياط",
            "http://live.mp3quran.net:9948/"),
        new Radio("عبدالله عواد الجهني",
            "http://live.mp3quran.net:9944/"),
        new Radio("عبدالمحسن الحارثي",
            "http://live.mp3quran.net:9856/"),
        new Radio("عبدالمحسن العبيكان",
            "http://live.mp3quran.net:9854/"),
        new Radio("عبدالمحسن القاسم",
            "http://live.mp3quran.net:9852/"),
        new Radio("عبدالهادي أحمد كناكري",
            "http://live.mp3quran.net:9850/"),
        new Radio("عبدالودود حنيف",
            "http://live.mp3quran.net:9848/"),
        new Radio("علي الحذيفي",
            "http://live.mp3quran.net:9844/"),
        new Radio("علي الحذيفي",
            "http://live.mp3quran.net:9846/"),
        new Radio("علي جابر",
            "http://live.mp3quran.net:9964/"),
        new Radio("علي حجاج السويسي",
            "http://live.mp3quran.net:9842/"),
        new Radio("عماد زهير حافظ",
            "http://live.mp3quran.net:9840/"),
        new Radio("عمر القزابري",
            "http://live.mp3quran.net:9838/"),
        new Radio("فارس عباد",
            "http://live.mp3quran.net:9972/"),
        new Radio("ماجد الزامل",
            "http://live.mp3quran.net:8022/"),
        new Radio("ماهر المعيقلي",
            "http://live.mp3quran.net:8002/"),
        new Radio("ماهر شخاشيرو",
            "http://live.mp3quran.net:9836/"),
        new Radio("محمد أيوب",
            "http://live.mp3quran.net:9960/"),
        new Radio("محمد أيوب - قراءة متميزة--",
            "http://live.mp3quran.net:9700/"),
        new Radio("محمد الطبلاوي",
            "http://live.mp3quran.net:9834/"),
        new Radio("محمد اللحيدان",
            "http://live.mp3quran.net:9832/"),
        new Radio("محمد جبريل",
            "http://live.mp3quran.net:9962/"),
        new Radio("محمد رشاد الشريف",
            "http://live.mp3quran.net:9830/"),
        new Radio("محمد صالح عالم شاه",
            "http://live.mp3quran.net:9828/"),
        new Radio("محمد عبدالحكيم سعيد العبدالله",
            "http://live.mp3quran.net:9814/"),
        new Radio("محمد عبدالحكيم سعيد العبدالله",
            "http://live.mp3quran.net:9816/"),
        new Radio("محمد عبدالكريم",
            "http://live.mp3quran.net:9822/"),
        new Radio("محمد عبدالكريم",
            "http://live.mp3quran.net:9824/"),
        new Radio("محمد عثمان خان ( من الهند )",
            "http://live.mp3quran.net:9820/"),
        new Radio("محمود الرفاعي",
            "http://live.mp3quran.net:9818/"),
        new Radio("محمود الشيمي",
            "http://live.mp3quran.net:9812/"),
        new Radio("مصطفى اللاهوني",
            "http://live.mp3quran.net:9798/"),
        new Radio("مصطفى رعد العزاوي",
            "http://live.mp3quran.net:9796/"),
        new Radio("معيض الحارثي",
            "http://live.mp3quran.net:9802/"),
        new Radio("مفتاح السلطني",
            "http://live.mp3quran.net:9788/"),
        new Radio("مفتاح السلطني",
            "http://live.mp3quran.net:9790/"),
        new Radio("مفتاح السلطني",
            "http://live.mp3quran.net:9792/"),
        new Radio("مفتاح السلطني",
            "http://live.mp3quran.net:9794/"),
        new Radio("موسى بلال",
            "http://live.mp3quran.net:9786/"),
        new Radio("ناصر العصفور",
            "http://live.mp3quran.net:8020/"),
        new Radio("ناصر القطامي",
            "http://live.mp3quran.net:9994/"),
        new Radio("ناصر الماجد",
            "http://live.mp3quran.net:9712/"),
        new Radio("نبيل الرفاعي",
            "http://live.mp3quran.net:9784/"),
        new Radio("نعمة الحسان",
            "http://live.mp3quran.net:9782/"),
        new Radio("هاني الرفاعي",
            "http://live.mp3quran.net:9780/"),
        new Radio("هيثم الجدعاني",
            "http://live.mp3quran.net:9714/"),
        new Radio("وليد النائحي",
            "http://live.mp3quran.net:9778/"),
        new Radio("ياسر الدوسري",
            "http://live.mp3quran.net:9984/"),
        new Radio("ياسر القرشي",
            "http://live.mp3quran.net:9776/"),
        new Radio("ياسر المزروعي ",
            "http://live.mp3quran.net:9774/"),
        new Radio("يحيى حوا",
            "http://live.mp3quran.net:9772/"),
        new Radio("يوسف الشويعي",
            "http://live.mp3quran.net:9770/"),
        new Radio("يوسف بن نوح أحمد",
            "http://live.mp3quran.net:9768/")];

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
          ar[index].url)));
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
  String data = '';
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
                            data = provider.isar()?ar[index].name:en[index].name;
                          });
                          _player.setAudioSource(AudioSource.uri(Uri.parse(
                              ar[index].url)));

                    },iconSize: 100,)),
                     Expanded(
                         child:IconButton(icon:  provider.isDarkModeEnable()? Image.asset("assets/playDark.png"):Image.asset("assets/play.png")
                       ,onPressed: () {
                             setState(() {
                               data = provider.isar()?ar[index].name:en[index].name;
                             });
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
                             data = provider.isar()?ar[index].name:en[index].name;
                           });
                         _player.setAudioSource(AudioSource.uri(Uri.parse(
                             ar[index].url)));
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



}
class Radio{
  late String name;
  late String url;

  Radio(this.name, this.url);
}


