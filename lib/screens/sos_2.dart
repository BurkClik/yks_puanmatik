import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SosyalBilimler extends StatefulWidget {
  @override
  _SosyalBilimlerState createState() => _SosyalBilimlerState();
}

class _SosyalBilimlerState extends State<SosyalBilimler> {
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
                  'TARİH 2(11)',
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
                          stateModel.cTrueAytTarih2(0);
                        } else if (int.parse(value) > 11 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytTarih2(11);
                        } else {
                          stateModel.cTrueAytTarih2(int.parse(value));
                        }
                        stateModel.tarih2Net((stateModel.tCountAytTarih2 -
                            stateModel.fCountAytTarih2 * 0.25));
                      },
                      initialValue: stateModel.tCountAytTarih2 == 0
                          ? ''
                          : stateModel.tCountAytTarih2.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[01])$'))
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
                          stateModel.cFalseAytTarih2(0);
                        } else if (int.parse(value) >
                            11 - stateModel.tCountAytTarih2) {
                          stateModel
                              .cFalseAytTarih2(11 - stateModel.tCountAytTarih2);
                        } else {
                          stateModel.cFalseAytTarih2(int.parse(value));
                        }
                        stateModel.tarih2Net((stateModel.tCountAytTarih2 -
                            stateModel.fCountAytTarih2 * 0.25));
                      },
                      initialValue: stateModel.fCountAytTarih2 == 0
                          ? ''
                          : stateModel.fCountAytTarih2.toString(),
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
                        '${stateModel.aytTarih2Net}',
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
                  'COĞRAFYA 2(11)',
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
                          stateModel.cTrueAytCog2(0);
                        } else if (int.parse(value) > 11 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytCog2(11);
                        } else {
                          stateModel.cTrueAytCog2(int.parse(value));
                        }
                        stateModel.cog2Net((stateModel.tCountAytCog2 -
                            stateModel.fCountAytCog2 * 0.25));
                      },
                      initialValue: stateModel.tCountAytCog2 == 0
                          ? ''
                          : stateModel.tCountAytCog2.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[01])$'))
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
                          stateModel.cFalseAytCog2(0);
                        } else if (int.parse(value) >
                            11 - stateModel.tCountAytCog2) {
                          stateModel
                              .cFalseAytCog2(11 - stateModel.tCountAytCog2);
                        } else {
                          stateModel.cFalseAytCog2(int.parse(value));
                        }
                        stateModel.cog2Net((stateModel.tCountAytCog2 -
                            stateModel.fCountAytCog2 * 0.25));
                      },
                      initialValue: stateModel.fCountAytCog2 == 0
                          ? ''
                          : stateModel.fCountAytCog2.toString(),
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
                        '${stateModel.aytCog2Net}',
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
                  'FELSEFE(12)',
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
                          stateModel.cTrueAytFelsefe(0);
                        } else if (int.parse(value) > 12 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytFelsefe(12);
                        } else {
                          stateModel.cTrueAytFelsefe(int.parse(value));
                        }
                        stateModel.felsefeNet((stateModel.tCountAytFelsefe -
                            stateModel.fCountAytFelsefe * 0.25));
                      },
                      initialValue: stateModel.tCountAytFelsefe == 0
                          ? ''
                          : stateModel.tCountAytFelsefe.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[012])$'))
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
                          stateModel.cFalseAytFelsefe(0);
                        } else if (int.parse(value) >
                            12 - stateModel.tCountAytFelsefe) {
                          stateModel.cFalseAytFelsefe(
                              12 - stateModel.tCountAytFelsefe);
                        } else {
                          stateModel.cFalseAytFelsefe(int.parse(value));
                        }
                        stateModel.felsefeNet((stateModel.tCountAytFelsefe -
                            stateModel.fCountAytFelsefe * 0.25));
                      },
                      initialValue: stateModel.fCountAytFelsefe == 0
                          ? ''
                          : stateModel.fCountAytFelsefe.toString(),
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
                        '${stateModel.aytFelsefeNet}',
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
                  'DİN KÜLTÜRÜ(6)',
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
                          stateModel.cTrueAytDin(0);
                        } else if (int.parse(value) > 6 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytDin(6);
                        } else {
                          stateModel.cTrueAytDin(int.parse(value));
                        }
                        stateModel.dinNet((stateModel.tCountAytDin -
                            stateModel.fCountAytDin * 0.25));
                      },
                      initialValue: stateModel.tCountAytDin == 0
                          ? ''
                          : stateModel.tCountAytDin.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^([1-6])$'))
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
                          stateModel.cFalseAytDin(0);
                        } else if (int.parse(value) >
                            6 - stateModel.tCountAytDin) {
                          stateModel.cFalseAytDin(6 - stateModel.tCountAytDin);
                        } else {
                          stateModel.cFalseAytDin(int.parse(value));
                        }
                        stateModel.dinNet((stateModel.tCountAytDin -
                            stateModel.fCountAytDin * 0.25));
                      },
                      initialValue: stateModel.fCountAytDin == 0
                          ? ''
                          : stateModel.fCountAytDin.toString(),
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
                        '${stateModel.aytDinNet}',
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
                        '${stateModel.tCountAytTarih2 + stateModel.tCountAytCog2 + stateModel.tCountAytFelsefe + stateModel.tCountAytDin}',
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
                        '${stateModel.fCountAytTarih2 + stateModel.fCountAytCog2 + stateModel.fCountAytFelsefe + stateModel.fCountAytDin}',
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
                        '${stateModel.aytTarih2Net + stateModel.aytCog2Net + stateModel.aytFelsefeNet + stateModel.aytDinNet}',
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
