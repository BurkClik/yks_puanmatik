import 'package:YksPuanmatik/client/hive_names.dart';
import 'package:YksPuanmatik/models/results.dart';
import 'package:YksPuanmatik/models/state_model.dart';
import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'screens/home.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ResultsAdapter());
  await Hive.openBox<Results>(HiveBoxes.results);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // TYT
  final double turkceNet = 0;
  final double sosyalNet = 0;
  final double matematikNet = 0;
  final double fenNet = 0;
  final int falseCountSos = 0;
  final int falseCountTr = 0;
  final int falseCountFen = 0;
  final int falseCountMat = 0;
  final int trueCountSos = 0;
  final int trueCountTr = 0;
  final int trueCountFen = 0;
  final int trueCountMat = 0;

  final double diploma = 0;

  // AYT SAY
  final double aytMatNet = 0;
  final double aytFizikNet = 0;
  final double aytKimyaNet = 0;
  final double aytBiyolojiNet = 0;
  final int falseCountAytMat = 0;
  final int falseCountAytFizik = 0;
  final int falseCountAytKimya = 0;
  final int falseCountAytBiyoloji = 0;
  final int trueCountAytMat = 0;
  final int trueCountAytFizik = 0;
  final int trueCountAytKimya = 0;
  final int trueCountAytBiyoloji = 0;

  // ATY ESIT AGIRLIK
  final double aytEdebNet = 0;
  final double aytTarih1Net = 0;
  final double aytCog1Net = 0;
  final int fCountAytEdeb = 0;
  final int fCountAytTarih1 = 0;
  final int fCountAytCog1 = 0;
  final int tCountAytEdeb = 0;
  final int tCountAytTarih1 = 0;
  final int tCountAytCog1 = 0;

  // DIL
  final double dilNet = 0;
  final int tCountDil = 0;
  final int fCountDil = 0;

  // AYT SOZEL
  final double aytTarih2Net = 0;
  final double aytCog2Net = 0;
  final double aytFelsefeNet = 0;
  final double aytDinNet = 0;
  final int fCountAytTarih2 = 0;
  final int fCountAytCog2 = 0;
  final int fCountAytFelsefe = 0;
  final int fCountAytDin = 0;
  final int tCountAytTarih2 = 0;
  final int tCountAytCog2 = 0;
  final int tCountAytFelsefe = 0;
  final int tCountAytDin = 0;
  final int appBarTitleIndex = 0;

  // PUANLAR
  final double tytPuan = 0;
  final double aytSayPuan = 0;
  final double aytEsitPuan = 0;
  final double aytSozelPuan = 0;
  final double aytDilPuan = 0;

  final bool diplomaState = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StateModel(
        turkceNet,
        sosyalNet,
        matematikNet,
        fenNet,
        falseCountTr,
        falseCountSos,
        falseCountMat,
        falseCountFen,
        trueCountTr,
        trueCountSos,
        trueCountMat,
        trueCountFen,
        diploma,
        aytMatNet,
        aytFizikNet,
        aytKimyaNet,
        aytBiyolojiNet,
        falseCountAytMat,
        falseCountAytFizik,
        falseCountAytKimya,
        falseCountAytBiyoloji,
        trueCountAytMat,
        trueCountAytFizik,
        trueCountAytKimya,
        trueCountAytBiyoloji,
        aytEdebNet,
        aytTarih1Net,
        aytCog1Net,
        fCountAytEdeb,
        fCountAytTarih1,
        fCountAytCog1,
        tCountAytEdeb,
        tCountAytTarih1,
        tCountAytCog1,
        dilNet,
        fCountDil,
        tCountDil,
        aytTarih2Net,
        aytCog2Net,
        aytFelsefeNet,
        aytDinNet,
        fCountAytTarih2,
        fCountAytCog2,
        fCountAytFelsefe,
        fCountDil,
        tCountAytTarih2,
        tCountAytCog2,
        tCountAytFelsefe,
        tCountAytDin,
        appBarTitleIndex,
        tytPuan,
        aytSayPuan,
        aytEsitPuan,
        aytSozelPuan,
        aytDilPuan,
        diplomaState,
      ),
      child: MaterialApp(
        title: 'Yks Puanmatik',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: Home(),
        //initialRoute: ,
        //routes: ,
      ),
    );
  }
}
