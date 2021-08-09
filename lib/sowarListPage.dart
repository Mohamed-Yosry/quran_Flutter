import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurahsList extends StatelessWidget {
  static const String routeName='homeList';

  List<Surah> surahs=[new Surah('الفاتحة', '7'),
    new Surah('البقرة', '286'),
    new Surah('آل عمران', '200'),
    new Surah('النساء', '176'),
    new Surah('المائدة', '120'),
    new Surah('الأنعام', '165'),
    new Surah('الأعراف', '206'),
    new Surah('الأنفال', '75'),
    new Surah('التوبة', '129'),
    new Surah('يونس', '109'),
    new Surah('هود', '123'),
    new Surah('يوسف', '111'),
    new Surah('الرعد', '43'),
    new Surah('إبراهيم', '52'),
    new Surah('الحجر', '99'),
    new Surah('النحل', '128'),
    new Surah('الإسراء', '111'),
    new Surah('الكهف', '110'),
    new Surah('مريم', '98'),
    new Surah('طه', '135'),
    new Surah('الأنبياء', '112'),
    new Surah('الحج', '78'),
    new Surah('المؤمنون', '118'),
    new Surah('النور', '64'),
    new Surah('الفرقان', '77'),
    new Surah('الشعراء', '227'),
    new Surah('النمل', '93'),
    new Surah('القصص', '88'),
    new Surah('العنكبوت', '69'),
    new Surah('الروم', '60'),
    new Surah('لقمان', '34'),
    new Surah('السجدة', '30'),
    new Surah('الأحزاب', '73'),
    new Surah('سباء', '54'),
    new Surah('فاطر', '45'),
    new Surah('يس', '83'),
    new Surah('الصافات', '182'),
    new Surah('ص', '88'),
    new Surah('الزمر', '75'),
    new Surah('غافر', '85'),
    new Surah('فصلت', '54'),
    new Surah('الشورى', '53'),
    new Surah('الزخرف', '89'),
    new Surah('الدخان', '59'),
    new Surah('الجاسية', '37'),
    new Surah('الاحقاق', '35'),
    new Surah('محمد', '38'),
    new Surah('الفتح', '29'),
    new Surah('الحجرات', '18'),
    new Surah('ق', '45'),
    new Surah('الذاريات', '60'),
    new Surah('الطور', '49'),
    new Surah('النجم', '62'),
    new Surah('القمر', '55'),
    new Surah('الرحمن', '78'),
    new Surah('الواقعة', '96'),
    new Surah('الحديد', '29'),
    new Surah('المجادلة', '22'),
    new Surah('الحشر', '24'),
    new Surah('الممتحنة', '13'),
    new Surah('الصف', '14'),
    new Surah('الجمعة', '11'),
    new Surah('المنافقون', '11'),
    new Surah('التغابن', '18'),
    new Surah('الطلاق', '12'),
    new Surah('التحريم', '12'),
    new Surah('الملك', '30'),
    new Surah('القلم', '52'),
    new Surah('الحاقة', '52'),
    new Surah('المعارج', '44'),
    new Surah('نوح', '28'),
    new Surah('الجن', '28'),
    new Surah('المزمل', '20'),
    new Surah('المدثر', '56'),
    new Surah('القيامة', '40'),
    new Surah('الإنسان', '31'),
    new Surah('المرسلات', '50'),
    new Surah('النبأ', '40'),
    new Surah('النازعات', '46'),
    new Surah('عبس', '42'),
    new Surah('التكوير', '29'),
    new Surah('الانطفار', '19'),
    new Surah('المطففين', '36'),
    new Surah('الإنشقاق', '25'),
    new Surah('البروج', '22'),
    new Surah('الطارق', '17'),
    new Surah('الأعلى', '19'),
    new Surah('الغاشية', '26'),
    new Surah('الفجر', '30'),
    new Surah('البلد', '20'),
    new Surah('الشمس', '15'),
    new Surah('الليل', '21'),
    new Surah('الضحى', '11'),
    new Surah('الشرح', '8'),
    new Surah('التين', '8'),
    new Surah('العلق', '19'),
    new Surah('القدر', '5'),
    new Surah('البينة', '8'),
    new Surah('الزلزلة', '8'),
    new Surah('العاديات', '11'),
    new Surah('القارعة', '11'),
    new Surah('التكاثر', '8'),
    new Surah('العصر', '3'),
    new Surah('الهمزة', '9'),
    new Surah('الفيل', '5'),
    new Surah('قريش', '4'),
    new Surah('الماعون', '7'),
    new Surah('الكوثر', '3'),
    new Surah('الكافرون', '6'),
    new Surah('النصر', '3'),
    new Surah('المسد', '5'),
    new Surah('الإخلاص', '4'),
    new Surah('الفلق', '5'),
    new Surah('الناس', '6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('إسلامي'),
        centerTitle: true,
      ),
      body:Container(
        child: new Column(
        children: [
          new Container(
            child: new Text('إسلامي'),
            alignment: Alignment.center,
          ),
          new Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo2.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          new Expanded(
            child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 23,
            ),
            children: surahs.map((e) => FlatButton(
                onPressed: (){},
                height: 20.0,
                child: Row(
                children:[
                  new Expanded(child: new Container(
                      child: new Text(e.ayatCount, textDirection: TextDirection.ltr,),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.orange, width: 2))),
                      ),
                  ),
                  new Expanded(child: new Container(
                      child: new Text(e.surahName, textDirection: TextDirection.rtl,),
                      alignment: Alignment.center,
                      )
                  )
                ],
            ))).toList(),
          ),)
          ],
        )
      )
    );
  }
}

class Surah
{
  final String surahName;
  final String ayatCount;
  Surah(this.surahName, this.ayatCount);
}



// ListView.builder(
//   itemCount: surahs.length,
//   itemBuilder: (context, index){
//     return Card(
//       child: ListTile
//         (
//           onTap: (){},
//           title: new Row(
//             children:[
//               new Expanded(child: new Container(
//                   child: new Text(surahs[index].surahName, textDirection: TextDirection.ltr,),
//                   decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.orange, width: 2))),
//                   ),
//               ),
//               new Expanded(child: new Container(
//                   child: new Text(surahs[index].ayatCount, textDirection: TextDirection.rtl,),
//                   )
//               )
//             ],
//           ),
//         )
//       );
//   },
//)