import 'package:hive/hive.dart';

part 'results.g.dart';

@HiveType(typeId: 0)
class Results extends HiveObject {
  @HiveField(0)
  String resultName;
  @HiveField(1)
  double tytPuan;
  @HiveField(2)
  double aytSayPuan;
  @HiveField(3)
  double aytEsitPuan;
  @HiveField(4)
  double aytSozelPuan;
  @HiveField(5)
  double aytDilPuan;
  @HiveField(6)
  int tytTrDogru;
  @HiveField(7)
  int tytTrYanlis;
  @HiveField(8)
  double tytTrNet;
  @HiveField(9)
  int tytSosDogru;
  @HiveField(10)
  int tytSosYanlis;
  @HiveField(11)
  double tytSosNet;
  @HiveField(12)
  int tytMatDogru;
  @HiveField(13)
  int tytMatYanlis;
  @HiveField(14)
  double tytMatNet;
  @HiveField(15)
  int tytFenDogru;
  @HiveField(16)
  int tytFenYanlis;
  @HiveField(17)
  double tytFenNet;
  @HiveField(18)
  int aytEdebDogru;
  @HiveField(19)
  int aytEdebYanlis;
  @HiveField(20)
  double aytEdebNet;
  @HiveField(21)
  int aytTarih1Dogru;
  @HiveField(22)
  int aytTarih1Yanlis;
  @HiveField(23)
  double aytTarih1Net;
  @HiveField(24)
  int aytCog1Dogru;
  @HiveField(25)
  int aytCog1Yanlis;
  @HiveField(26)
  double aytCog1Net;
  @HiveField(27)
  int aytTarih2Dogru;
  @HiveField(28)
  int aytTarih2Yanlis;
  @HiveField(29)
  double aytTarih2Net;
  @HiveField(30)
  int aytCog2Dogru;
  @HiveField(31)
  int aytCog2Yanlis;
  @HiveField(32)
  double aytCog2Net;
  @HiveField(33)
  int aytFelDogru;
  @HiveField(34)
  int aytFelYanlis;
  @HiveField(35)
  double aytFelNet;
  @HiveField(36)
  int aytDinDogru;
  @HiveField(37)
  int aytDinYanlis;
  @HiveField(38)
  double aytDinNet;
  @HiveField(39)
  int aytMatDogru;
  @HiveField(40)
  int aytMatYanlis;
  @HiveField(41)
  double aytMatNet;
  @HiveField(42)
  int aytFizDogru;
  @HiveField(43)
  int aytFizYanlis;
  @HiveField(44)
  double aytFizNet;
  @HiveField(45)
  int aytKimDogru;
  @HiveField(46)
  int aytKimYanlis;
  @HiveField(47)
  double aytKimNet;
  @HiveField(48)
  int aytBiyDogru;
  @HiveField(49)
  int aytBiyYanlis;
  @HiveField(50)
  double aytBiyNet;
  @HiveField(51)
  int dilDogru;
  @HiveField(52)
  int dilYanlis;
  @HiveField(53)
  double dilNet;

  Results({
    this.resultName,
    this.tytPuan,
    this.aytSayPuan,
    this.aytEsitPuan,
    this.aytSozelPuan,
    this.aytDilPuan,
    this.tytTrDogru,
    this.tytTrYanlis,
    this.tytTrNet,
    this.tytSosDogru,
    this.tytSosYanlis,
    this.tytSosNet,
    this.tytMatDogru,
    this.tytMatYanlis,
    this.tytMatNet,
    this.tytFenDogru,
    this.tytFenYanlis,
    this.tytFenNet,
    this.aytEdebDogru,
    this.aytEdebYanlis,
    this.aytEdebNet,
    this.aytTarih1Dogru,
    this.aytTarih1Yanlis,
    this.aytTarih1Net,
    this.aytCog1Dogru,
    this.aytCog1Yanlis,
    this.aytCog1Net,
    this.aytTarih2Dogru,
    this.aytTarih2Yanlis,
    this.aytTarih2Net,
    this.aytCog2Dogru,
    this.aytCog2Yanlis,
    this.aytCog2Net,
    this.aytFelDogru,
    this.aytFelYanlis,
    this.aytFelNet,
    this.aytDinDogru,
    this.aytDinYanlis,
    this.aytDinNet,
    this.aytMatDogru,
    this.aytMatYanlis,
    this.aytMatNet,
    this.aytFizDogru,
    this.aytFizYanlis,
    this.aytFizNet,
    this.aytKimDogru,
    this.aytKimYanlis,
    this.aytKimNet,
    this.aytBiyDogru,
    this.aytBiyYanlis,
    this.aytBiyNet,
    this.dilDogru,
    this.dilYanlis,
    this.dilNet,
  });
}
