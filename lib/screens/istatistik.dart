import 'package:YksPuanmatik/client/hive_names.dart';
import 'package:YksPuanmatik/models/results.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fl_chart/fl_chart.dart';

class Istatistik extends StatefulWidget {
  @override
  _IstatistikState createState() => _IstatistikState();
}

class _IstatistikState extends State<Istatistik> {
  List<bool> isSelected = [true, false, false, false, false];
  int examNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(40.0)),
              child: ToggleButtons(
                children: [
                  Text('TYT'),
                  Text(' SAYISAL '),
                  Text(' EŞİT AĞIRLIK '),
                  Text(' SÖZEL '),
                  Text('DİL'),
                ],
                borderRadius: BorderRadius.circular(10.0),
                borderColor: kPrimaryColor,
                borderWidth: 2.0,
                fillColor: kPrimaryColor,
                selectedBorderColor: kPrimaryColor,
                selectedColor: kSecondaryColor,
                color: kPrimaryColor,
                textStyle: TextStyle(fontWeight: FontWeight.w600),
                onPressed: (index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = !isSelected[buttonIndex];
                        examNumber = index;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ),
          ),
          Spacer(),
          Flexible(
            flex: 4,
            child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<Results>(HiveBoxes.results).listenable(),
              builder: (context, Box<Results> box, _) {
                if (box.values.isEmpty) {
                  return Center(
                    child: Text(
                      'Sınav bulunamadı',
                      style: TextStyle(color: kPrimaryColor, fontSize: 24.0),
                    ),
                  );
                }
                List<BarChartGroupData> demo(int examNumber) {
                  switch (examNumber) {
                    case 0:
                      return [
                        BarChartGroupData(
                          x: 0,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytTrDogru.toDouble())
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytTrYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytTrNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytSosDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytSosYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytSosNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytMatDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytMatYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytMatNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytFenDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytFenYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.tytFenNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                      ];

                    case 1:
                      return [
                        BarChartGroupData(
                          x: 0,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytMatDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytMatYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytMatNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytFizDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytFizYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytFizNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytKimDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytKimYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytKimNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytBiyDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytBiyYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytBiyNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                      ];

                    case 2:
                      return [
                        BarChartGroupData(
                          x: 0,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytMatDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytMatYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytMatNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytEdebDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytEdebYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytEdebNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih1Dogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih1Yanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih1Net)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog1Dogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog1Yanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog1Net)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                      ];

                    case 3:
                      return [
                        BarChartGroupData(
                          x: 0,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytEdebDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytEdebYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytEdebNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih1Dogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih1Yanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih1Net)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog1Dogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog1Yanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog1Net)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih2Dogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih2Yanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytTarih2Net)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog2Dogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog2Yanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytCog2Net)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytFelDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytFelYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytFelNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytDinDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytDinYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.aytDinNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                      ];

                    case 4:
                      return [
                        BarChartGroupData(
                          x: 0,
                          barsSpace: 5.0,
                          barRods: [
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.dilDogru)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.greenAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.dilYanlis)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.redAccent],
                            ),
                            BarChartRodData(
                              y: box.values
                                      .toList()
                                      .map((e) => e.dilNet)
                                      .reduce(
                                          (value, element) => value + element) /
                                  box.values.length,
                              colors: [Colors.lightBlueAccent],
                            ),
                          ],
                          showingTooltipIndicators: [0, 1, 2],
                        ),
                      ];

                    default:
                      return [];
                  }
                }

                return AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: kPrimaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(8),
                              left: getProportionateScreenHeight(8)),
                          child: Text('ORTALAMA', style: kDarkBarTextStyle),
                        ),
                        Expanded(
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: examNumber == 4 ? 90 : 50,
                              barTouchData: BarTouchData(
                                enabled: false,
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.transparent,
                                  tooltipPadding: const EdgeInsets.all(0),
                                  tooltipBottomMargin: 8,
                                  getTooltipItem: (
                                    BarChartGroupData group,
                                    int groupIndex,
                                    BarChartRodData rod,
                                    int rodIndex,
                                  ) {
                                    return BarTooltipItem(
                                      rod.y.round().toString(),
                                      TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (value) => const TextStyle(
                                      color: kSecondaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  margin: 20,
                                  getTitles: (double value) {
                                    if (examNumber == 0) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'Türkçe';
                                        case 1:
                                          return 'Sosyal';
                                        case 2:
                                          return 'Matematik';
                                        case 3:
                                          return 'Fen';
                                        default:
                                          return '';
                                      }
                                    } else if (examNumber == 1) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'Matematik';
                                        case 1:
                                          return 'Fizik';
                                        case 2:
                                          return 'Kimya';
                                        case 3:
                                          return 'Biyoloji';
                                        default:
                                          return '';
                                      }
                                    } else if (examNumber == 2) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'Matematik';
                                        case 1:
                                          return 'Edebiyat';
                                        case 2:
                                          return 'Tarih 1';
                                        case 3:
                                          return 'Coğrafya 1';
                                        default:
                                          return '';
                                      }
                                    } else if (examNumber == 3) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'Edeb';
                                        case 1:
                                          return 'Tarih 1';
                                        case 2:
                                          return 'Coğ 1';
                                        case 3:
                                          return 'Tarih 2';
                                        case 4:
                                          return 'Coğ 2';
                                        case 5:
                                          return 'Felsefe';
                                        case 6:
                                          return 'Din';
                                        default:
                                          return '';
                                      }
                                    } else if (examNumber == 4) {
                                      return 'Dil';
                                    } else {
                                      return '';
                                    }
                                  },
                                ),
                                leftTitles: SideTitles(showTitles: false),
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: demo(examNumber),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
