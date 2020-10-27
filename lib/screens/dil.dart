import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Dil extends StatefulWidget {
  @override
  _DilState createState() => _DilState();
}

class _DilState extends State<Dil> {
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
                  'DİL(80)',
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
                          stateModel.cTrueDil(0);
                        } else if (int.parse(value) > 80 ||
                            int.parse(value) < 0) {
                          stateModel.cTrueDil(80);
                        } else {
                          stateModel.cTrueDil(int.parse(value));
                        }
                        stateModel.dilNet((stateModel.tCountDil -
                            stateModel.fCountDil * 0.25));
                      },
                      initialValue: stateModel.tCountDil == 0
                          ? ''
                          : stateModel.tCountDil.toString(),
                      keyboardType: TextInputType.number,
                      style: kTextFieldStyle,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([1-9]|[1-7][0-9]|80)$'))
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
                          stateModel.cFalseDil(0);
                        } else if (int.parse(value) >
                            80 - stateModel.tCountDil) {
                          stateModel.cFalseDil(80 - stateModel.tCountDil);
                        } else {
                          stateModel.cFalseDil(int.parse(value));
                        }
                        stateModel.dilNet((stateModel.tCountDil -
                            stateModel.fCountDil * 0.25));
                      },
                      initialValue: stateModel.fCountDil == 0
                          ? ''
                          : stateModel.fCountDil.toString(),
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
                        '${stateModel.dil}',
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
