import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Fen extends StatefulWidget {
  @override
  _FenState createState() => _FenState();
}

class _FenState extends State<Fen> {
  @override
  Widget build(BuildContext context) {
    final stateModel = context.watch<StateModel>();
    return Column(
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
                  'AYT',
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
              width: getProportionateScreenWidth(100.0),
              color: kLightBarColor,
              child: Center(
                child: Text(
                  'FİZİK(14)',
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
                          stateModel.cTrueAytFizik(0);
                        } else if (int.parse(value) > 14 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytFizik(14);
                        } else {
                          stateModel.cTrueAytFizik(int.parse(value));
                        }
                        stateModel.fizikAytNet((stateModel.trueCountAytFizik -
                            stateModel.falseCountAytFizik * 0.25));
                      },
                      initialValue: stateModel.trueCountAytFizik == 0
                          ? ''
                          : stateModel.trueCountAytFizik.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[01234])$'))
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
                          stateModel.cFalseAytFizik(0);
                        } else if (int.parse(value) >
                            14 - stateModel.trueCountAytFizik) {
                          stateModel.cFalseAytFizik(
                              14 - stateModel.trueCountAytFizik);
                        } else {
                          stateModel.cFalseAytFizik(int.parse(value));
                        }
                        stateModel.fizikAytNet((stateModel.trueCountAytFizik -
                            stateModel.falseCountAytFizik * 0.25));
                      },
                      initialValue: stateModel.falseCountAytFizik == 0
                          ? ''
                          : stateModel.falseCountAytFizik.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      cursorColor: kPrimaryColor,
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(64.0),
                    height: getProportionateScreenHeight(26.0),
                    decoration: kNetBoxDecoration,
                    child: Center(
                      child: Text(
                        '${stateModel.aytFizikNet}',
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
              width: getProportionateScreenWidth(100.0),
              color: kLightBarColor,
              child: Center(
                child: Text(
                  'KİMYA(13)',
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
                          stateModel.cTrueAytKimya(0);
                        } else if (int.parse(value) > 13 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytKimya(13);
                        } else {
                          stateModel.cTrueAytKimya(int.parse(value));
                        }
                        stateModel.kimyaAytNet((stateModel.trueCountAytKimya -
                            stateModel.falseCountAytKimya * 0.25));
                      },
                      initialValue: stateModel.trueCountAytKimya == 0
                          ? ''
                          : stateModel.trueCountAytKimya.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[0123])$'))
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
                          stateModel.cFalseAytKimya(0);
                        } else if (int.parse(value) >
                            13 - stateModel.trueCountAytKimya) {
                          stateModel.cFalseAytKimya(
                              13 - stateModel.trueCountAytKimya);
                        } else {
                          stateModel.cFalseAytKimya(int.parse(value));
                        }
                        stateModel.kimyaAytNet((stateModel.trueCountAytKimya -
                            stateModel.falseCountAytKimya * 0.25));
                      },
                      initialValue: stateModel.falseCountAytKimya == 0
                          ? ''
                          : stateModel.falseCountAytKimya.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      cursorColor: kPrimaryColor,
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(64.0),
                    height: getProportionateScreenHeight(26.0),
                    decoration: kNetBoxDecoration,
                    child: Center(
                      child: Text(
                        '${stateModel.aytKimyaNet}',
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
              width: getProportionateScreenWidth(100.0),
              color: kLightBarColor,
              child: Center(
                child: Text(
                  'BİYOLOJİ(13)',
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
                          stateModel.cTrueAytBiyoloji(0);
                        } else if (int.parse(value) > 13 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytBiyoloji(13);
                        } else {
                          stateModel.cTrueAytBiyoloji(int.parse(value));
                        }
                        stateModel.biyolojiAytNet(
                            (stateModel.trueCountAytBiyoloji -
                                stateModel.falseCountAytBiyoloji * 0.25));
                      },
                      initialValue: stateModel.trueCountAytBiyoloji == 0
                          ? ''
                          : stateModel.trueCountAytBiyoloji.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[0123])$'))
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
                          stateModel.cFalseAytBiyoloji(0);
                        } else if (int.parse(value) >
                            13 - stateModel.trueCountAytBiyoloji) {
                          stateModel.cFalseAytBiyoloji(
                              13 - stateModel.trueCountAytBiyoloji);
                        } else {
                          stateModel.cFalseAytBiyoloji(int.parse(value));
                        }
                        stateModel.biyolojiAytNet(
                            (stateModel.trueCountAytBiyoloji -
                                stateModel.falseCountAytBiyoloji * 0.25));
                      },
                      initialValue: stateModel.falseCountAytBiyoloji == 0
                          ? ''
                          : stateModel.falseCountAytBiyoloji.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      cursorColor: kPrimaryColor,
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(64.0),
                    height: getProportionateScreenHeight(26.0),
                    decoration: kNetBoxDecoration,
                    child: Center(
                      child: Text(
                        '${stateModel.aytBiyolojiNet}',
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
              width: getProportionateScreenWidth(100.0),
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
                        '${stateModel.trueCountAytFizik + stateModel.trueCountAytKimya + stateModel.trueCountAytBiyoloji}',
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
                        '${stateModel.falseCountAytFizik + stateModel.falseCountAytKimya + stateModel.falseCountAytBiyoloji}',
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
                        '${stateModel.aytFizikNet + stateModel.aytKimyaNet + stateModel.aytBiyolojiNet}',
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
    );
  }
}
