import 'package:YksPuanmatik/client/hive_names.dart';
import 'package:YksPuanmatik/models/results.dart';
import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/screens/dil.dart';
import 'package:YksPuanmatik/screens/fen.dart';
import 'package:YksPuanmatik/screens/matematik.dart';
import 'package:YksPuanmatik/screens/sinav_content.dart';
import 'package:YksPuanmatik/screens/sos_1.dart';
import 'package:YksPuanmatik/screens/sos_2.dart';
import 'package:YksPuanmatik/screens/tyt.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:hive/hive.dart';

class Puan extends StatefulWidget {
  @override
  _PuanState createState() => _PuanState();
}

class _PuanState extends State<Puan> {
  int currentPage = 0;
  bool mezun = false;
  String examName;
  double tytP;
  double aytSayPuan;
  double aytEsitPuan;
  double aytSozelPuan;
  double aytDilPuan;

  List<Widget> screens = [
    Tyt(),
    TurkDili(),
    SosyalBilimler(),
    Matematik(),
    Fen(),
    Dil()
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final stateModel = context.watch<StateModel>();

    double tytPuan(double temelKat, double alanKat) {
      return (stateModel.trNet * temelKat +
          stateModel.sosNet * alanKat +
          stateModel.matNet * temelKat +
          stateModel.fenNet * alanKat +
          100);
    }

    double sayisalP() {
      return (tytPuan(1.32, 1.36) +
          stateModel.aytMatNet * 3 +
          stateModel.aytFizikNet * 2.85 +
          stateModel.aytKimyaNet * 3.07 +
          stateModel.aytBiyolojiNet * 3.07);
    }

    double esitP() {
      return (tytPuan(1.32, 1.36) +
          stateModel.aytEdebNet * 3 +
          stateModel.aytTarih1Net * 2.8 +
          stateModel.aytCog1Net * 3.33 +
          stateModel.aytMatNet * 3);
    }

    double dilP() {
      return (tytPuan(1.32, 1.36) + stateModel.dil * 3);
    }

    double sozelP() {
      return (tytPuan(1.32, 1.36) +
          stateModel.aytEdebNet * 3 +
          stateModel.aytTarih1Net * 2.8 +
          stateModel.aytCog1Net * 3.33 +
          stateModel.aytTarih2Net * 2.91 +
          stateModel.aytCog2Net * 2.91 +
          stateModel.aytFelsefeNet * 3 +
          stateModel.aytDinNet * 3.33);
    }

    void _onFormSubmit() {
      Box<Results> contactBox = Hive.box<Results>(HiveBoxes.results);
      contactBox.add(Results(
        resultName: examName,
        tytPuan: tytPuan(3.3, 3.4),
        aytSayPuan: sayisalP(),
        aytEsitPuan: esitP(),
        aytSozelPuan: sozelP(),
        aytDilPuan: dilP(),
        tytTrDogru: stateModel.trueCountTr,
        tytTrYanlis: stateModel.falseCountTr,
        tytTrNet: stateModel.trNet,
        tytSosDogru: stateModel.trueCountSos,
        tytSosYanlis: stateModel.falseCountSos,
        tytSosNet: stateModel.sosNet,
        tytMatDogru: stateModel.trueCountMat,
        tytMatYanlis: stateModel.falseCountMat,
        tytMatNet: stateModel.matNet,
        tytFenDogru: stateModel.trueCountFen,
        tytFenYanlis: stateModel.falseCountFen,
        tytFenNet: stateModel.fenNet,
        aytEdebDogru: stateModel.tCountAytEdeb,
        aytEdebYanlis: stateModel.fCountAytEdeb,
        aytEdebNet: stateModel.aytEdebNet,
        aytTarih1Dogru: stateModel.tCountAytTarih1,
        aytTarih1Yanlis: stateModel.fCountAytTarih1,
        aytTarih1Net: stateModel.aytTarih1Net,
        aytCog1Dogru: stateModel.tCountAytCog1,
        aytCog1Yanlis: stateModel.fCountAytCog1,
        aytCog1Net: stateModel.aytCog1Net,
        aytTarih2Dogru: stateModel.tCountAytTarih2,
        aytTarih2Yanlis: stateModel.fCountAytTarih2,
        aytTarih2Net: stateModel.aytTarih2Net,
        aytCog2Dogru: stateModel.tCountAytCog2,
        aytCog2Yanlis: stateModel.fCountAytCog2,
        aytCog2Net: stateModel.aytCog2Net,
        aytFelDogru: stateModel.tCountAytFelsefe,
        aytFelYanlis: stateModel.fCountAytFelsefe,
        aytFelNet: stateModel.aytFelsefeNet,
        aytDinDogru: stateModel.tCountAytDin,
        aytDinYanlis: stateModel.fCountAytDin,
        aytDinNet: stateModel.aytDinNet,
        aytMatDogru: stateModel.trueCountAytMat,
        aytMatYanlis: stateModel.falseCountAytMat,
        aytMatNet: stateModel.aytMatNet,
        aytFizDogru: stateModel.trueCountAytFizik,
        aytFizYanlis: stateModel.falseCountAytFizik,
        aytFizNet: stateModel.aytFizikNet,
        aytKimDogru: stateModel.trueCountAytKimya,
        aytKimYanlis: stateModel.falseCountAytKimya,
        aytKimNet: stateModel.aytKimyaNet,
        aytBiyDogru: stateModel.trueCountAytBiyoloji,
        aytBiyYanlis: stateModel.falseCountAytBiyoloji,
        aytBiyNet: stateModel.aytBiyolojiNet,
        dilDogru: stateModel.tCountDil,
        dilYanlis: stateModel.fCountDil,
        dilNet: stateModel.dil,
      ));
    }

    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(
                  () {
                    currentPage = value;
                    stateModel.changeAppBar(value);
                  },
                );
              },
              itemCount: screens.length,
              itemBuilder: (context, index) => SinavContent(
                exams: screens[index],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                screens.length,
                (index) => buildDot(index: index),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(26.0),
                        width: getProportionateScreenWidth(220.0),
                        color: kPrimaryColor,
                        child: Center(
                          child: Text(
                            'DIPLOMA NOTU',
                            style: kDarkBarTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(36)),
                      Container(
                        height: getProportionateScreenHeight(26.0),
                        width: getProportionateScreenWidth(84.0),
                        decoration: kTrueFalseBoxDecoration,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value == '' || int.parse(value) < 0) {
                              stateModel.changeDiploma(0);
                            } else if (int.parse(value) > 100) {
                              stateModel.changeDiploma(100);
                            } else {
                              stateModel.changeDiploma(double.parse(value));
                            }
                          },
                          initialValue: stateModel.diploma == 0
                              ? ''
                              : stateModel.diploma.toString(),
                          keyboardType: TextInputType.number,
                          style: kTextFieldStyle,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^([1-9]|[0-9][0-9]|100)$'))
                          ],
                          cursorColor: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: kPrimaryColor,
                        checkColor: kSecondaryColor,
                        value: mezun,
                        onChanged: (value) {
                          mezun = value;
                          if (mezun) {
                            stateModel.changeDiploma(stateModel.diploma / 2);
                          } else {
                            stateModel.changeDiploma(stateModel.diploma * 2);
                          }
                        },
                      ),
                      Text(
                        'Geçen sene bir bölüme yerleştim',
                        style: kLightBarTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(100.0),
                      color: kPrimaryColor,
                      child: Center(
                        child: Text(
                          'PUAN',
                          style: kDarkBarTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(252.0),
                      height: getProportionateScreenHeight(26.0),
                      color: kLightBarColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'HAM',
                            style: kLightBarTextStyle,
                          ),
                          Text(
                            'YERLEŞTİRME',
                            style: kLightBarTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(24.0)),
                PuanRow(
                  examName: "TYT",
                  puanH: tytPuan(3.3, 3.4),
                  puanY: tytPuan(3.3, 3.4) + stateModel.diploma * 5 * 0.12,
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                PuanRow(
                  examName: "SAYISAL",
                  puanH: sayisalP(),
                  puanY: sayisalP() + stateModel.diploma * 5 * 0.12,
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                PuanRow(
                  examName: 'EŞİT AĞIRLIK',
                  puanH: esitP(),
                  puanY: esitP() + stateModel.diploma * 5 * 0.12,
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                PuanRow(
                  examName: "SÖZEL",
                  puanH: sozelP(),
                  puanY: sozelP() + stateModel.diploma * 5 * 0.12,
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                PuanRow(
                  examName: "DİL",
                  puanH: dilP(),
                  puanY: dilP() + stateModel.diploma * 5 * 0.12,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Alert(
                    context: context,
                    title: "Sınav Adını Giriniz",
                    content: TextFormField(
                      onChanged: (value) {
                        examName = value;
                      },
                      initialValue: examName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesome.pencil),
                      ),
                    ),
                    buttons: [
                      DialogButton(
                        child: Text('KAYDET', style: kDarkBarTextStyle),
                        color: kPrimaryColor,
                        onPressed: () {
                          if (examName != '') {
                            _onFormSubmit();
                            examName = '';
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                              msg: 'Başarıyla Kaydedildi',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.amber,
                              textColor: Colors.black,
                              fontSize: 16.0,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'İsmi boş bırakmayınız',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },
                      ),
                    ],
                  ).show();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: kPrimaryColor,
                child: Text('KAYDET', style: kDarkBarTextStyle),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(6)),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kLightBarColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class PuanRow extends StatelessWidget {
  final String examName;
  final double puanH;
  final double puanY;

  const PuanRow({
    Key key,
    this.examName,
    this.puanH,
    this.puanY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: getProportionateScreenHeight(26.0),
          width: getProportionateScreenWidth(100.0),
          color: kLightBarColor,
          child: Center(
            child: Text(
              examName,
              style: kClassesTextStyle,
            ),
          ),
        ),
        Container(
          width: getProportionateScreenWidth(252.0),
          height: getProportionateScreenHeight(26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: getProportionateScreenWidth(96.0),
                height: getProportionateScreenHeight(26.0),
                decoration: kNetBoxDecoration,
                child: Center(
                  child: Text(
                    puanH != null ? puanH.toStringAsFixed(3) : '0',
                    style: kTextFieldStyle,
                  ),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(96.0),
                height: getProportionateScreenHeight(26.0),
                decoration: kNetBoxDecoration,
                child: Center(
                  child: Text(
                    puanY != null ? puanY.toStringAsFixed(3) : '0',
                    style: kTextFieldStyle,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
