import 'package:YksPuanmatik/client/hive_names.dart';
import 'package:YksPuanmatik/models/results.dart';
import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class Sinavlar extends StatefulWidget {
  @override
  _SinavlarState createState() => _SinavlarState();
}

class _SinavlarState extends State<Sinavlar> {
  @override
  Widget build(BuildContext context) {
    final stateModel = context.watch<StateModel>();
    return ValueListenableBuilder(
      valueListenable: Hive.box<Results>(HiveBoxes.results).listenable(),
      builder: (context, Box<Results> box, _) {
        if (box.values.isEmpty) {
          return Center(
            child: Text(
              'Kaydedilmiş sınav bulunamadı',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24.0,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            Results res = box.getAt(index);
            return Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.center,
                  childrenPadding: EdgeInsets.all(16.0),
                  backgroundColor: kSecondaryColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 32,
                      color: Colors.redAccent.shade700,
                    ),
                    onPressed: () {
                      res.delete();
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      print('Yollarım');
                      Share.share(
                          "TYT: ${res.tytPuan}\nSAYISAL: ${res.aytSayPuan}\nEŞİT AĞIRLIK: ${res.aytEsitPuan}\nSÖZEL: ${res.aytSozelPuan}\nDİL: ${res.aytDilPuan}");
                    },
                  ),
                  title: Text(
                    res.resultName.toUpperCase(),
                    style: TextStyle(
                      fontSize: 24.0,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    ExpansionRow(
                      label: 'TYT',
                      puanH: res.tytPuan.toStringAsFixed(2),
                      puanY: (res.tytPuan + stateModel.diploma * 5 * 0.12)
                          .toStringAsFixed(2),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    ExpansionRow(
                      label: 'SAYISAL',
                      puanH: res.aytSayPuan.toStringAsFixed(2),
                      puanY: (res.aytSayPuan + stateModel.diploma * 5 * 0.12)
                          .toStringAsFixed(2),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    ExpansionRow(
                      label: 'EŞİT AĞIRLIK',
                      puanH: res.aytEsitPuan.toStringAsFixed(2),
                      puanY: (res.aytEsitPuan + stateModel.diploma * 5 * 0.12)
                          .toStringAsFixed(2),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    ExpansionRow(
                      label: 'SÖZEL',
                      puanH: res.aytSozelPuan.toStringAsFixed(2),
                      puanY: (res.aytSozelPuan + stateModel.diploma * 5 * 0.12)
                          .toStringAsFixed(2),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    ExpansionRow(
                      label: 'DİL',
                      puanH: res.aytDilPuan.toStringAsFixed(2),
                      puanY: (res.aytDilPuan + stateModel.diploma * 5 * 0.12)
                          .toStringAsFixed(2),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    RaisedButton(
                      onPressed: () async {
                        final bool result = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(14.0),
                                child: Container(
                                  width: double.infinity,
                                  height: getProportionateScreenHeight(600),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: getProportionateScreenHeight(
                                                16),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height:
                                                    getProportionateScreenHeight(
                                                        26.0),
                                                width:
                                                    getProportionateScreenWidth(
                                                        88.0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  padding: EdgeInsets.all(0),
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: Colors.red,
                                                    size: 36.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    getProportionateScreenWidth(
                                                        252.0),
                                                height:
                                                    getProportionateScreenHeight(
                                                        26.0),
                                                color: kLightBarColor,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'DOĞRU',
                                                      style: kLightBarTextStyle,
                                                    ),
                                                    Text(
                                                      'YANLIŞ',
                                                      style: kLightBarTextStyle,
                                                    ),
                                                    Text(
                                                      'NET',
                                                      style: kLightBarTextStyle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(24)),
                                      Flexible(
                                        flex: 12,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              DetailsRow(
                                                ders: 'TÜRKÇE',
                                                dogru: res.tytTrDogru,
                                                yanlis: res.tytTrYanlis,
                                                net: res.tytTrNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'SOSYAL',
                                                dogru: res.tytSosDogru,
                                                yanlis: res.tytSosYanlis,
                                                net: res.tytSosNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'MATEMATİK 1',
                                                dogru: res.tytMatDogru,
                                                yanlis: res.tytMatYanlis,
                                                net: res.tytMatNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'FEN',
                                                dogru: res.tytFenDogru,
                                                yanlis: res.tytFenYanlis,
                                                net: res.tytFenNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'EDEBİYAT',
                                                dogru: res.aytEdebDogru,
                                                yanlis: res.aytEdebYanlis,
                                                net: res.aytEdebNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'TARİH 1',
                                                dogru: res.aytTarih1Dogru,
                                                yanlis: res.aytTarih1Yanlis,
                                                net: res.aytTarih1Net,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'COĞRAFYA 1',
                                                dogru: res.aytCog1Dogru,
                                                yanlis: res.aytCog1Yanlis,
                                                net: res.aytCog1Net,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'TARİH 2',
                                                dogru: res.aytTarih2Dogru,
                                                yanlis: res.aytTarih2Yanlis,
                                                net: res.aytTarih2Net,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'COĞRAFYA 2',
                                                dogru: res.aytCog2Dogru,
                                                yanlis: res.aytCog2Yanlis,
                                                net: res.aytCog2Net,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'FELSEFE',
                                                dogru: res.aytFelDogru,
                                                yanlis: res.aytFelYanlis,
                                                net: res.aytFelNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'DİN',
                                                dogru: res.aytDinDogru,
                                                yanlis: res.aytDinYanlis,
                                                net: res.aytDinNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'MATEMATİK 2',
                                                dogru: res.aytMatDogru,
                                                yanlis: res.aytMatYanlis,
                                                net: res.aytMatNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'FİZİK',
                                                dogru: res.aytFizDogru,
                                                yanlis: res.aytFizYanlis,
                                                net: res.aytFizNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'KİMYA',
                                                dogru: res.aytKimDogru,
                                                yanlis: res.aytKimYanlis,
                                                net: res.aytKimNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'BİYOLOJİ',
                                                dogru: res.aytBiyDogru,
                                                yanlis: res.aytBiyYanlis,
                                                net: res.aytBiyNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        12),
                                              ),
                                              DetailsRow(
                                                ders: 'DİL',
                                                dogru: res.dilDogru,
                                                yanlis: res.dilYanlis,
                                                net: res.dilNet,
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        8),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                        return result;
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.0,
                        vertical: 8.0,
                      ),
                      elevation: 4.0,
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Detaylar',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String ders;
  final int dogru;
  final int yanlis;
  final double net;

  const DetailsRow({Key key, this.ders, this.dogru, this.yanlis, this.net})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: getProportionateScreenHeight(26.0),
          width: getProportionateScreenWidth(88.0),
          color: kLightBarColor,
          child: Center(
            child: Text(
              ders,
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
              DetailsRowTextField(textField: dogru.toString()),
              DetailsRowTextField(textField: yanlis.toString()),
              DetailsRowTextField(textField: net.toString()),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailsRowTextField extends StatelessWidget {
  final String textField;

  const DetailsRowTextField({Key key, this.textField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(64.0),
      height: getProportionateScreenHeight(26.0),
      decoration: kNetBoxDecoration,
      child: Center(
        child: Text(
          textField,
          style: kTextFieldStyle,
        ),
      ),
    );
  }
}

class ExpansionRow extends StatelessWidget {
  final String label;
  final String puanH;
  final String puanY;

  const ExpansionRow({Key key, this.label, this.puanH, this.puanY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: kLightBarColor,
          width: getProportionateScreenWidth(75),
          height: getProportionateScreenHeight(26),
          child: Center(
            child: Text(
              label,
              style: kClassesTextStyle,
            ),
          ),
        ),
        ExpansionPuan(puan: puanH),
        ExpansionPuan(puan: puanY),
      ],
    );
  }
}

class ExpansionPuan extends StatelessWidget {
  const ExpansionPuan({
    Key key,
    @required this.puan,
  }) : super(key: key);

  final String puan;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(26.0),
      width: getProportionateScreenWidth(64.0),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        boxShadow: [kTextFieldShadow],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Center(
        child: Text(puan, style: kTextFieldStyle),
      ),
    );
  }
}
