import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Yedek extends StatefulWidget {
  @override
  _YedekState createState() => _YedekState();
}

class _YedekState extends State<Yedek> {
  int currentPage = 0;
  bool mezun = false;

  double tytPuan(double tr, double sos, double mat, double fen) {
    return (tr * 3.25 + sos * 3.5 + mat * 3.25 + fen * 3.5 + 100);
  }

  @override
  Widget build(BuildContext context) {
    final stateModel = context.watch<StateModel>();
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kPrimaryColor,
                      child: Center(
                        child: Text(
                          'TYT',
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
                SizedBox(height: getProportionateScreenHeight(24.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'TÜRKÇE',
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
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '') {
                                  stateModel.changetrueCountTr(0);
                                } else if (int.parse(value) > 40 ||
                                    int.parse(value) < 0) {
                                  stateModel.changetrueCountTr(40);
                                } else {
                                  stateModel
                                      .changetrueCountTr(int.parse(value));
                                }
                                stateModel.changeTr((stateModel.trueCountTr -
                                    stateModel.falseCountTr * 0.25));
                              },
                              initialValue: stateModel.trueCountTr == 0
                                  ? ''
                                  : stateModel.trueCountTr.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '' || int.parse(value) < 0) {
                                  stateModel.changeFalseCountTr(0);
                                } else {
                                  stateModel
                                      .changeFalseCountTr(int.parse(value));
                                }
                                stateModel.changeTr((stateModel.trueCountTr -
                                    stateModel.falseCountTr * 0.25));
                              },
                              initialValue: stateModel.falseCountTr == 0
                                  ? ''
                                  : stateModel.falseCountTr.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(64.0),
                            height: getProportionateScreenHeight(26.0),
                            decoration: kNetBoxDecoration,
                            child: Center(
                              child: Text(
                                '${stateModel.trNet}',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'SOSYAL',
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
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '') {
                                  stateModel.changetrueCountSos(0);
                                } else if (int.parse(value) > 20 ||
                                    int.parse(value) < 0) {
                                  stateModel.changetrueCountSos(20);
                                } else {
                                  stateModel
                                      .changetrueCountSos(int.parse(value));
                                }
                                stateModel.changeSos((stateModel.trueCountSos -
                                    stateModel.falseCountSos * 0.25));
                              },
                              initialValue: stateModel.trueCountSos == 0
                                  ? ''
                                  : stateModel.trueCountSos.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '') {
                                  stateModel.changeFalseCountSos(0);
                                } else if (int.parse(value) < 0) {
                                  stateModel.changeFalseCountSos(0);
                                } else {
                                  stateModel
                                      .changeFalseCountSos(int.parse(value));
                                }
                                stateModel.changeSos((stateModel.trueCountSos -
                                    stateModel.falseCountSos * 0.25));
                              },
                              initialValue: stateModel.falseCountSos == 0
                                  ? ''
                                  : stateModel.falseCountSos.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(64.0),
                            height: getProportionateScreenHeight(26.0),
                            decoration: kNetBoxDecoration,
                            child: Center(
                              child: Text(
                                '${stateModel.sosNet}',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'MATEMATİK',
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
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '') {
                                  stateModel.changetrueCountMat(40);
                                } else if (int.parse(value) > 40) {
                                  stateModel.changetrueCountMat(40);
                                } else {
                                  stateModel
                                      .changetrueCountMat(int.parse(value));
                                }
                                stateModel.changeMat((stateModel.trueCountMat -
                                    stateModel.falseCountMat * 0.25));
                              },
                              initialValue: stateModel.trueCountMat == 0
                                  ? ''
                                  : stateModel.trueCountMat.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '' || int.parse(value) < 0) {
                                  stateModel.changeFalseCountMat(0);
                                } else {
                                  stateModel
                                      .changeFalseCountMat(int.parse(value));
                                }
                                stateModel.changeMat((stateModel.trueCountMat -
                                    stateModel.falseCountMat * 0.25));
                              },
                              initialValue: stateModel.falseCountMat == 0
                                  ? ''
                                  : stateModel.falseCountMat.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(64.0),
                            height: getProportionateScreenHeight(26.0),
                            decoration: kNetBoxDecoration,
                            child: Center(
                              child: Text(
                                '${stateModel.matNet}',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'FEN',
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
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '') {
                                  stateModel.changetrueCountFen(0);
                                } else if (int.parse(value) > 20) {
                                  stateModel.changetrueCountFen(20);
                                } else {
                                  stateModel
                                      .changetrueCountFen(int.parse(value));
                                }
                                stateModel.changeFen(stateModel.trueCountFen -
                                    stateModel.falseCountFen * 0.25);
                              },
                              initialValue: stateModel.trueCountFen == 0
                                  ? ''
                                  : stateModel.trueCountFen.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(26.0),
                            width: getProportionateScreenWidth(64.0),
                            decoration: kTrueFalseBoxDecoration,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value == '' || int.parse(value) < 0) {
                                  stateModel.changeFalseCountFen(0);
                                } else {
                                  stateModel
                                      .changeFalseCountFen(int.parse(value));
                                }
                                stateModel.changeFen(stateModel.trueCountFen -
                                    stateModel.falseCountFen * 0.25);
                              },
                              initialValue: stateModel.falseCountFen == 0
                                  ? ''
                                  : stateModel.falseCountFen.toString(),
                              keyboardType: TextInputType.number,
                              style: kTextFieldStyle,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor: kPrimaryColor,
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(64.0),
                            height: getProportionateScreenHeight(26.0),
                            decoration: kNetBoxDecoration,
                            child: Center(
                              child: Text(
                                '${stateModel.fenNet}',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'TOPLAM',
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
                            width: getProportionateScreenWidth(64.0),
                            height: getProportionateScreenHeight(26.0),
                            decoration: kNetBoxDecoration,
                            child: Center(
                              child: Text(
                                '${stateModel.trueCountTr + stateModel.trueCountSos + stateModel.trueCountMat + stateModel.trueCountFen}',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(64.0),
                            height: getProportionateScreenHeight(26.0),
                            decoration: kNetBoxDecoration,
                            child: Center(
                              child: Text(
                                '${stateModel.falseCountTr + stateModel.falseCountSos + stateModel.falseCountMat + stateModel.falseCountFen}',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(64.0),
                            height: getProportionateScreenHeight(26.0),
                            decoration: kNetBoxDecoration,
                            child: Center(
                              child: Text(
                                '${stateModel.trNet + stateModel.sosNet + stateModel.matNet + stateModel.fenNet}',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          buildDot(index: 0),
          SizedBox(height: getProportionateScreenHeight(8)),
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
                            FilteringTextInputFormatter.digitsOnly
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
                          print(value);
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
                      width: getProportionateScreenWidth(88.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'TYT',
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
                                tytPuan(
                                  stateModel.trNet,
                                  stateModel.sosNet,
                                  stateModel.matNet,
                                  stateModel.fenNet,
                                ).toString(),
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
                                (tytPuan(
                                          stateModel.trNet,
                                          stateModel.sosNet,
                                          stateModel.matNet,
                                          stateModel.fenNet,
                                        ) +
                                        stateModel.diploma * 0.12 * 5)
                                    .toString(),
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'SAYISAL',
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
                                '0',
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
                                '0',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'EŞİT AĞIRLIK',
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
                                '0',
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
                                '0',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'SÖZEL',
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
                                '0',
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
                                '0',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(26.0),
                      width: getProportionateScreenWidth(88.0),
                      color: kLightBarColor,
                      child: Center(
                        child: Text(
                          'DİL',
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
                                '0',
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
                                '0',
                                style: kTextFieldStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  print('Türkce -> ${stateModel.trNet}');
                  print('Sosyal -> ${stateModel.sosNet}');
                  print('Mat -> ${stateModel.matNet}');
                  print('Fen -> ${stateModel.fenNet}');
                  print('Diploma -> ${stateModel.diploma}');
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
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kLightBarColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
