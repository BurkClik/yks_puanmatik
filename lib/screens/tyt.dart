import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Tyt extends StatefulWidget {
  @override
  _TytState createState() => _TytState();
}

class _TytState extends State<Tyt> {
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
              width: getProportionateScreenWidth(100.0),
              color: kLightBarColor,
              child: Center(
                child: Text(
                  'TÜRKÇE(40)',
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
                        } else {
                          stateModel.changetrueCountTr(int.parse(value));
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
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|[1-3][0-9]|40)$'))
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
                        } else if (int.parse(value) >
                            40 - stateModel.trueCountTr) {
                          stateModel
                              .changeFalseCountTr(40 - stateModel.trueCountTr);
                        } else {
                          stateModel.changeFalseCountTr(int.parse(value));
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
              width: getProportionateScreenWidth(100.0),
              color: kLightBarColor,
              child: Center(
                child: Text(
                  'SOSYAL(20)',
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
                          stateModel.changetrueCountSos(int.parse(value));
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
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[0-9]|20)$'))
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
                        } else if (int.parse(value) >
                            20 - stateModel.trueCountSos) {
                          stateModel.changeFalseCountSos(
                              20 - stateModel.trueCountSos);
                        } else {
                          stateModel.changeFalseCountSos(int.parse(value));
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
              width: getProportionateScreenWidth(100.0),
              color: kLightBarColor,
              child: Center(
                child: Text(
                  'MATEMATİK(40)',
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
                          stateModel.changetrueCountMat(0);
                        } else if (int.parse(value) > 40) {
                          stateModel.changetrueCountMat(40);
                        } else {
                          stateModel.changetrueCountMat(int.parse(value));
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
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|[1-3][0-9]|40)$'))
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
                        } else if (int.parse(value) >
                            40 - stateModel.trueCountMat) {
                          stateModel.changeFalseCountMat(
                              40 - stateModel.trueCountMat);
                        } else {
                          stateModel.changeFalseCountMat(int.parse(value));
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
              width: getProportionateScreenWidth(100.0),
              color: kLightBarColor,
              child: Center(
                child: Text(
                  'FEN(20)',
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
                        }
                        stateModel.changetrueCountFen(int.parse(value));

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
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|1[0-9]|20)$'))
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
                        } else if (int.parse(value) >
                            20 - stateModel.trueCountFen) {
                          stateModel.changeFalseCountFen(
                              20 - stateModel.trueCountFen);
                        } else {
                          stateModel.changeFalseCountFen(int.parse(value));
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
    );
  }
}
