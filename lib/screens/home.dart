import 'package:YksPuanmatik/models/state_model.dart';
import 'package:YksPuanmatik/screens/istatistik.dart';
import 'package:YksPuanmatik/screens/sinavlar.dart';
import 'package:YksPuanmatik/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:YksPuanmatik/theme/size_config.dart';
import 'package:YksPuanmatik/screens/puan.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _screens = [
    Sinavlar(),
    Puan(),
    Istatistik(),
  ];

  final List<List<String>> _appBarTitle = [
    ["GEÇMİŞ SINAVLAR"],
    [
      "TEMEL YETERLİLİK SINAVI",
      "SOSYAL BİLİMLER 1",
      "SOSYAL BİLİMLER 2",
      "MATEMATİK",
      "FEN BİLİMLERi",
      "DİL"
    ],
    ["İSTATİSTİKLER"]
  ];

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final stateModel = context.watch<StateModel>();
    final List<List<String>> _appBarTitle = [
      ["GEÇMİŞ SINAVLAR"],
      [
        "TEMEL YETERLİLİK SINAVI",
        "SOSYAL BİLİMLER 1",
        "SOSYAL BİLİMLER 2",
        "MATEMATİK",
        "FEN BİLİMLERi",
        "DİL"
      ],
      ["İSTATİSTİKLER"]
    ];
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        toolbarHeight: 46.0,
        title: Text(
          _currentIndex == 1
              ? _appBarTitle[_currentIndex][stateModel.appBarTitle]
              : _appBarTitle[_currentIndex][0],
          style: TextStyle(
            color: kLightTextColor,
            fontSize: 18.0,
            letterSpacing: 2.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            if (value != 1) {
              stateModel.changeAppBar(0);
            }
          });
        },
        backgroundColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        selectedItemColor: kThirdColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Sınavlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hesaplama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'İstatistikler',
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
