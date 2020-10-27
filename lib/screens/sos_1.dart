import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TurkDili extends StatefulWidget {
  @override
  _TurkDiliState createState() => _TurkDiliState();
}

class _TurkDiliState extends State<TurkDili> {
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
                  'EDEBİYAT(24)',
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
                          stateModel.cTrueAytEdeb(0);
                        } else if (int.parse(value) > 24 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytEdeb(24);
                        } else {
                          stateModel.cTrueAytEdeb(int.parse(value));
                        }
                        stateModel.edebNet((stateModel.tCountAytEdeb -
                            stateModel.fCountAytEdeb * 0.25));
                      },
                      initialValue: stateModel.tCountAytEdeb == 0
                          ? ''
                          : stateModel.tCountAytEdeb.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[0-9]|2[01234])$'))
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
                          stateModel.cFalseAytEdeb(0);
                        } else if (int.parse(value) >
                            24 - stateModel.tCountAytEdeb) {
                          stateModel
                              .cFalseAytEdeb(24 - stateModel.tCountAytEdeb);
                        } else {
                          stateModel.cFalseAytEdeb(int.parse(value));
                        }
                        stateModel.edebNet((stateModel.tCountAytEdeb -
                            stateModel.fCountAytEdeb * 0.25));
                      },
                      initialValue: stateModel.fCountAytEdeb == 0
                          ? ''
                          : stateModel.fCountAytEdeb.toString(),
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
                        '${stateModel.aytEdebNet}',
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
                  'TARİH 1(10)',
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
                          stateModel.cTrueAytTarih1(0);
                        } else if (int.parse(value) > 10 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytTarih1(10);
                        } else {
                          stateModel.cTrueAytTarih1(int.parse(value));
                        }
                        stateModel.tarih1Net((stateModel.tCountAytTarih1 -
                            stateModel.fCountAytTarih1 * 0.25));
                      },
                      initialValue: stateModel.tCountAytTarih1 == 0
                          ? ''
                          : stateModel.tCountAytTarih1.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|10)$'))
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
                          stateModel.cFalseAytTarih1(0);
                        } else if (int.parse(value) >
                            10 - stateModel.tCountAytTarih1) {
                          stateModel
                              .cFalseAytTarih1(10 - stateModel.tCountAytTarih1);
                        } else {
                          stateModel.cFalseAytTarih1(int.parse(value));
                        }
                        stateModel.tarih1Net((stateModel.tCountAytTarih1 -
                            stateModel.fCountAytTarih1 * 0.25));
                      },
                      initialValue: stateModel.fCountAytTarih1 == 0
                          ? ''
                          : stateModel.fCountAytTarih1.toString(),
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
                        '${stateModel.aytTarih1Net}',
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
                  'COĞRAFYA 1(6)',
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
                          stateModel.cTrueAytCog1(0);
                        } else if (int.parse(value) > 6 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytCog1(6);
                        } else {
                          stateModel.cTrueAytCog1(int.parse(value));
                        }
                        stateModel.cog1Net((stateModel.tCountAytCog1 -
                            stateModel.fCountAytCog1 * 0.25));
                      },
                      initialValue: stateModel.tCountAytCog1 == 0
                          ? ''
                          : stateModel.tCountAytCog1.toString(),
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
                          stateModel.cFalseAytCog1(0);
                        } else if (int.parse(value) >
                            6 - stateModel.tCountAytCog1) {
                          stateModel
                              .cFalseAytCog1(6 - stateModel.tCountAytCog1);
                        } else {
                          stateModel.cFalseAytCog1(int.parse(value));
                        }
                        stateModel.cog1Net((stateModel.tCountAytCog1 -
                            stateModel.fCountAytCog1 * 0.25));
                      },
                      initialValue: stateModel.fCountAytCog1 == 0
                          ? ''
                          : stateModel.fCountAytCog1.toString(),
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
                        '${stateModel.aytCog1Net}',
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
                        '${stateModel.tCountAytEdeb + stateModel.tCountAytTarih1 + stateModel.tCountAytCog1}',
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
                        '${stateModel.fCountAytEdeb + stateModel.fCountAytTarih1 + stateModel.fCountAytCog1}',
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
                        '${stateModel.aytEdebNet + stateModel.aytTarih1Net + stateModel.aytCog1Net}',
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
