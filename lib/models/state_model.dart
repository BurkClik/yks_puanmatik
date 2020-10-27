import 'package:flutter/cupertino.dart';

class StateModel extends ChangeNotifier {
  // AMELELİK SINIFI
  int _appBarTitle;
  int get appBarTitle => _appBarTitle;

  bool _diplomaState;
  bool get diplomaState => _diplomaState;

  // PUANLAR
  double _tytPuan;
  double _aytSayPuan;
  double _aytEsitPuan;
  double _aytSozelPuan;
  double _aytDilPuan;

  double get tytPuan => _tytPuan;
  double get aytSayPuan => _aytSayPuan;
  double get aytEsitPuan => _aytEsitPuan;
  double get aytSozelPuan => _aytSozelPuan;
  double get aytDilPuan => _aytDilPuan;

  // TYT
  double _matNet;
  double _sosNet;
  double _trNet;
  double _fenNet;

  // DİPLOMA
  double _diploma;

  // AYT MAT
  double _aytMatNet;

  // AYT FEN
  double _aytFizikNet;
  double _aytKimyaNet;
  double _aytBiyolojiNet;

  // AYT ESIT
  double _aytEdebNet;
  double _aytTarih1Net;
  double _aytCog1Net;

  // DIL
  double _dil;

  // AYT SOZEL
  double _aytTarih2Net;
  double _aytCog2Net;
  double _aytFelsefeNet;
  double _aytDinNet;

  // TYT FALSE - TRUE
  int _falseCountTr;
  int _falseCountSos;
  int _falseCountMat;
  int _falseCountFen;
  int _trueCountTr;
  int _trueCountSos;
  int _trueCountMat;
  int _trueCountFen;

  // AYT MAT FALSE - TRUE
  int _falseCountAytMat;
  int _trueCountAytMat;

  // AYT FEN FALSE - TRUE
  int _falseCountAytFizik;
  int _falseCountAytKimya;
  int _falseCountAytBiyoloji;
  int _trueCountAytFizik;
  int _trueCountAytKimya;
  int _trueCountAytBiyoloji;

  // AYT ESIT FALSE - TRUE
  int _fCountAytEdeb;
  int _fCountAytTarih1;
  int _fCountAytCog1;
  int _tCountAytEdeb;
  int _tCountAytTarih1;
  int _tCountAytCog1;

  // DIL FALSE - TRUE
  int _tCountDil;
  int _fCountDil;

  // AYT SOZEL FALSE - TRUE
  int _fCountAytTarih2;
  int _fCountAytCog2;
  int _fCountAytFelsefe;
  int _fCountAytDin;
  int _tCountAytTarih2;
  int _tCountAytCog2;
  int _tCountAytFelsefe;
  int _tCountAytDin;

  // TYT
  double get matNet => _matNet;
  double get sosNet => _sosNet;
  double get fenNet => _fenNet;
  double get trNet => _trNet;

  // DIPLOMA
  double get diploma => _diploma;

  // AYT MAT
  double get aytMatNet => _aytMatNet;

  // AYT FEN
  double get aytFizikNet => _aytFizikNet;
  double get aytKimyaNet => _aytKimyaNet;
  double get aytBiyolojiNet => _aytBiyolojiNet;

  // AYT ESIT AGIRLIK
  double get aytEdebNet => _aytEdebNet;
  double get aytTarih1Net => _aytTarih1Net;
  double get aytCog1Net => _aytCog1Net;

  // DIL
  double get dil => _dil;

  // AYT SOZEL
  double get aytTarih2Net => _aytTarih2Net;
  double get aytCog2Net => _aytCog2Net;
  double get aytFelsefeNet => _aytFelsefeNet;
  double get aytDinNet => _aytDinNet;

  // TYT FALSE - TRUE
  int get falseCountTr => _falseCountTr;
  int get falseCountSos => _falseCountSos;
  int get falseCountMat => _falseCountMat;
  int get falseCountFen => _falseCountFen;
  int get trueCountTr => _trueCountTr;
  int get trueCountSos => _trueCountSos;
  int get trueCountMat => _trueCountMat;
  int get trueCountFen => _trueCountFen;

  // AYT MAT FALSE - TRUE
  int get falseCountAytMat => _falseCountAytMat;
  int get trueCountAytMat => _trueCountAytMat;

  // AYT FEN FALSE - TRUE
  int get falseCountAytFizik => _falseCountAytFizik;
  int get falseCountAytKimya => _falseCountAytKimya;
  int get falseCountAytBiyoloji => _falseCountAytBiyoloji;
  int get trueCountAytFizik => _trueCountAytFizik;
  int get trueCountAytKimya => _trueCountAytKimya;
  int get trueCountAytBiyoloji => _trueCountAytBiyoloji;

  // AYT ESIT AGIRLIK FALSE - TRUE
  int get fCountAytEdeb => _fCountAytEdeb;
  int get fCountAytTarih1 => _fCountAytTarih1;
  int get fCountAytCog1 => _fCountAytCog1;
  int get tCountAytEdeb => _tCountAytEdeb;
  int get tCountAytTarih1 => _tCountAytTarih1;
  int get tCountAytCog1 => _tCountAytCog1;

  // DIL FALSE - TRUE
  int get fCountDil => _fCountDil;
  int get tCountDil => _tCountDil;

  // AYT SOZEL FALSE _ TRUE
  int get fCountAytTarih2 => _fCountAytTarih2;
  int get fCountAytCog2 => _fCountAytCog2;
  int get fCountAytFelsefe => _fCountAytFelsefe;
  int get fCountAytDin => _fCountAytDin;
  int get tCountAytTarih2 => _tCountAytTarih2;
  int get tCountAytCog2 => _tCountAytCog2;
  int get tCountAytFelsefe => _tCountAytFelsefe;
  int get tCountAytDin => _tCountAytDin;

  StateModel(
      this._trNet,
      this._sosNet,
      this._matNet,
      this._fenNet,
      this._falseCountTr,
      this._falseCountSos,
      this._falseCountMat,
      this._falseCountFen,
      this._trueCountTr,
      this._trueCountSos,
      this._trueCountMat,
      this._trueCountFen,
      this._diploma,
      this._aytMatNet,
      this._aytFizikNet,
      this._aytKimyaNet,
      this._aytBiyolojiNet,
      this._falseCountAytMat,
      this._falseCountAytFizik,
      this._falseCountAytKimya,
      this._falseCountAytBiyoloji,
      this._trueCountAytMat,
      this._trueCountAytFizik,
      this._trueCountAytKimya,
      this._trueCountAytBiyoloji,
      this._aytEdebNet,
      this._aytTarih1Net,
      this._aytCog1Net,
      this._fCountAytEdeb,
      this._fCountAytTarih1,
      this._fCountAytCog1,
      this._tCountAytEdeb,
      this._tCountAytTarih1,
      this._tCountAytCog1,
      this._dil,
      this._fCountDil,
      this._tCountDil,
      this._aytTarih2Net,
      this._aytCog2Net,
      this._aytFelsefeNet,
      this._aytDinNet,
      this._fCountAytTarih2,
      this._fCountAytCog2,
      this._fCountAytFelsefe,
      this._fCountAytDin,
      this._tCountAytTarih2,
      this._tCountAytCog2,
      this._tCountAytFelsefe,
      this._tCountAytDin,
      this._appBarTitle,
      this._tytPuan,
      this._aytSayPuan,
      this._aytEsitPuan,
      this._aytSozelPuan,
      this._aytDilPuan,
      this._diplomaState);

  void cDiplomaState(bool newState) {
    _diplomaState = newState;
    notifyListeners();
  }

  void cTytPuan(double puan) {
    _tytPuan = puan;
    notifyListeners();
  }

  void cAytSayPuan(double puan) {
    _aytSayPuan = puan;
    notifyListeners();
  }

  void cAytEsitPuan(double puan) {
    _aytEsitPuan = puan;
    notifyListeners();
  }

  void cAytSozelPuan(double puan) {
    _aytSozelPuan = puan;
    notifyListeners();
  }

  void cAytDilPuan(double puan) {
    _aytDilPuan = puan;
    notifyListeners();
  }

  void changeAppBar(int index) {
    _appBarTitle = index;
    notifyListeners();
  }

  // TYT Net
  void changeMat(double newNet) {
    _matNet = newNet;
    notifyListeners();
  }

  void changeSos(double newNet) {
    _sosNet = newNet;
    notifyListeners();
  }

  void changeTr(double newNet) {
    _trNet = newNet;
    notifyListeners();
  }

  void changeFen(double newNet) {
    _fenNet = newNet;
    notifyListeners();
  }

  // TYT Yanlış
  void changeFalseCountSos(int falseCounts) {
    _falseCountSos = falseCounts;
    notifyListeners();
  }

  void changeFalseCountTr(int falseCounts) {
    _falseCountTr = falseCounts;
    notifyListeners();
  }

  void changeFalseCountMat(int falseCounts) {
    _falseCountMat = falseCounts;
    notifyListeners();
  }

  void changeFalseCountFen(int falseCounts) {
    _falseCountFen = falseCounts;
    notifyListeners();
  }

  // TYT Doğru
  void changetrueCountSos(int trueCounts) {
    _trueCountSos = trueCounts;
    notifyListeners();
  }

  void changetrueCountTr(int trueCounts) {
    _trueCountTr = trueCounts;
    notifyListeners();
  }

  void changetrueCountMat(int trueCounts) {
    _trueCountMat = trueCounts;
    notifyListeners();
  }

  void changetrueCountFen(int trueCounts) {
    _trueCountFen = trueCounts;
    notifyListeners();
  }

  void changeDiploma(double diploma) {
    _diploma = diploma;
    notifyListeners();
  }

  // AYT Net
  void matAytNet(double newNet) {
    _aytMatNet = newNet;
    notifyListeners();
  }

  void fizikAytNet(double newNet) {
    _aytFizikNet = newNet;
    notifyListeners();
  }

  void kimyaAytNet(double newNet) {
    _aytKimyaNet = newNet;
    notifyListeners();
  }

  void biyolojiAytNet(double newNet) {
    _aytBiyolojiNet = newNet;
    notifyListeners();
  }

  // AYT False
  void cFalseAytMat(int falseCounts) {
    _falseCountAytMat = falseCounts;
    notifyListeners();
  }

  void cFalseAytFizik(int falseCounts) {
    _falseCountAytFizik = falseCounts;
    notifyListeners();
  }

  void cFalseAytKimya(int falseCounts) {
    _falseCountAytKimya = falseCounts;
    notifyListeners();
  }

  void cFalseAytBiyoloji(int falseCounts) {
    _falseCountAytBiyoloji = falseCounts;
    notifyListeners();
  }

  // AYT True
  void cTrueAytMat(int trueCounts) {
    _trueCountAytMat = trueCounts;
    notifyListeners();
  }

  void cTrueAytFizik(int trueCounts) {
    _trueCountAytFizik = trueCounts;
    notifyListeners();
  }

  void cTrueAytKimya(int trueCounts) {
    _trueCountAytKimya = trueCounts;
    notifyListeners();
  }

  void cTrueAytBiyoloji(int trueCounts) {
    _trueCountAytBiyoloji = trueCounts;
    notifyListeners();
  }

  // AYT Esit Agirlik True
  void cTrueAytEdeb(int trueCounts) {
    _tCountAytEdeb = trueCounts;
    notifyListeners();
  }

  void cTrueAytTarih1(int trueCounts) {
    _tCountAytTarih1 = trueCounts;
    notifyListeners();
  }

  void cTrueAytCog1(int trueCounts) {
    _tCountAytCog1 = trueCounts;
    notifyListeners();
  }

  void cFalseAytEdeb(int falseCounts) {
    _fCountAytEdeb = falseCounts;
    notifyListeners();
  }

  void cFalseAytTarih1(int falseCounts) {
    _fCountAytTarih1 = falseCounts;
    notifyListeners();
  }

  void cFalseAytCog1(int falseCounts) {
    _fCountAytCog1 = falseCounts;
    notifyListeners();
  }

  // AYT Sozel True
  void cTrueAytTarih2(int trueCounts) {
    _tCountAytTarih2 = trueCounts;
    notifyListeners();
  }

  void cTrueAytCog2(int trueCounts) {
    _tCountAytCog2 = trueCounts;
    notifyListeners();
  }

  void cTrueAytFelsefe(int trueCounts) {
    _tCountAytFelsefe = trueCounts;
    notifyListeners();
  }

  void cTrueAytDin(int trueCounts) {
    _tCountAytDin = trueCounts;
    notifyListeners();
  }

  void cFalseAytTarih2(int falseCounts) {
    _fCountAytTarih2 = falseCounts;
    notifyListeners();
  }

  void cFalseAytCog2(int falseCounts) {
    _fCountAytCog2 = falseCounts;
    notifyListeners();
  }

  void cFalseAytFelsefe(int falseCounts) {
    _fCountAytFelsefe = falseCounts;
    notifyListeners();
  }

  void cFalseAytDin(int trueCounts) {
    _fCountAytDin = trueCounts;
    notifyListeners();
  }

  // AYT Sozel Net
  void tarih2Net(double newNet) {
    _aytTarih2Net = newNet;
    notifyListeners();
  }

  void cog2Net(double newNet) {
    _aytCog2Net = newNet;
    notifyListeners();
  }

  void felsefeNet(double newNet) {
    _aytFelsefeNet = newNet;
    notifyListeners();
  }

  void dinNet(double newNet) {
    _aytDinNet = newNet;
    notifyListeners();
  }

  // AYT Esit Agirlik Net
  void edebNet(double newNet) {
    _aytEdebNet = newNet;
    notifyListeners();
  }

  void tarih1Net(double newNet) {
    _aytTarih1Net = newNet;
    notifyListeners();
  }

  void cog1Net(double newNet) {
    _aytCog1Net = newNet;
    notifyListeners();
  }

  // DIL
  void dilNet(double newNet) {
    _dil = newNet;
    notifyListeners();
  }

  void cTrueDil(int trueCount) {
    _tCountDil = trueCount;
    notifyListeners();
  }

  void cFalseDil(int falseCount) {
    _fCountDil = falseCount;
    notifyListeners();
  }
}
