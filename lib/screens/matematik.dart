import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Matematik extends StatefulWidget {
  @override
  _MatematikState createState() => _MatematikState();
}

class _MatematikState extends State<Matematik> {
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
                          stateModel.cTrueAytMat(0);
                        } else if (int.parse(value) > 40 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueAytMat(40);
                        } else {
                          stateModel.cTrueAytMat(int.parse(value));
                        }
                        stateModel.matAytNet((stateModel.trueCountAytMat -
                            stateModel.falseCountAytMat * 0.25));
                      },
                      initialValue: stateModel.trueCountAytMat == 0
                          ? ''
                          : stateModel.trueCountAytMat.toString(),
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
                          stateModel.cFalseAytMat(0);
                        } else if (int.parse(value) >
                            40 - stateModel.trueCountAytMat) {
                          stateModel
                              .cFalseAytMat(40 - stateModel.trueCountAytMat);
                        } else {
                          stateModel.cFalseAytMat(int.parse(value));
                        }
                        stateModel.matAytNet((stateModel.trueCountAytMat -
                            stateModel.falseCountAytMat * 0.25));
                      },
                      initialValue: stateModel.falseCountAytMat == 0
                          ? ''
                          : stateModel.falseCountAytMat.toString(),
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
                        '${stateModel.aytMatNet}',
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
