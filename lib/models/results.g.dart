// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 0;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      resultName: fields[0] as String,
      tytPuan: fields[1] as double,
      aytSayPuan: fields[2] as double,
      aytEsitPuan: fields[3] as double,
      aytSozelPuan: fields[4] as double,
      aytDilPuan: fields[5] as double,
      tytTrDogru: fields[6] as int,
      tytTrYanlis: fields[7] as int,
      tytTrNet: fields[8] as double,
      tytSosDogru: fields[9] as int,
      tytSosYanlis: fields[10] as int,
      tytSosNet: fields[11] as double,
      tytMatDogru: fields[12] as int,
      tytMatYanlis: fields[13] as int,
      tytMatNet: fields[14] as double,
      tytFenDogru: fields[15] as int,
      tytFenYanlis: fields[16] as int,
      tytFenNet: fields[17] as double,
      aytEdebDogru: fields[18] as int,
      aytEdebYanlis: fields[19] as int,
      aytEdebNet: fields[20] as double,
      aytTarih1Dogru: fields[21] as int,
      aytTarih1Yanlis: fields[22] as int,
      aytTarih1Net: fields[23] as double,
      aytCog1Dogru: fields[24] as int,
      aytCog1Yanlis: fields[25] as int,
      aytCog1Net: fields[26] as double,
      aytTarih2Dogru: fields[27] as int,
      aytTarih2Yanlis: fields[28] as int,
      aytTarih2Net: fields[29] as double,
      aytCog2Dogru: fields[30] as int,
      aytCog2Yanlis: fields[31] as int,
      aytCog2Net: fields[32] as double,
      aytFelDogru: fields[33] as int,
      aytFelYanlis: fields[34] as int,
      aytFelNet: fields[35] as double,
      aytDinDogru: fields[36] as int,
      aytDinYanlis: fields[37] as int,
      aytDinNet: fields[38] as double,
      aytMatDogru: fields[39] as int,
      aytMatYanlis: fields[40] as int,
      aytMatNet: fields[41] as double,
      aytFizDogru: fields[42] as int,
      aytFizYanlis: fields[43] as int,
      aytFizNet: fields[44] as double,
      aytKimDogru: fields[45] as int,
      aytKimYanlis: fields[46] as int,
      aytKimNet: fields[47] as double,
      aytBiyDogru: fields[48] as int,
      aytBiyYanlis: fields[49] as int,
      aytBiyNet: fields[50] as double,
      dilDogru: fields[51] as int,
      dilYanlis: fields[52] as int,
      dilNet: fields[53] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(54)
      ..writeByte(0)
      ..write(obj.resultName)
      ..writeByte(1)
      ..write(obj.tytPuan)
      ..writeByte(2)
      ..write(obj.aytSayPuan)
      ..writeByte(3)
      ..write(obj.aytEsitPuan)
      ..writeByte(4)
      ..write(obj.aytSozelPuan)
      ..writeByte(5)
      ..write(obj.aytDilPuan)
      ..writeByte(6)
      ..write(obj.tytTrDogru)
      ..writeByte(7)
      ..write(obj.tytTrYanlis)
      ..writeByte(8)
      ..write(obj.tytTrNet)
      ..writeByte(9)
      ..write(obj.tytSosDogru)
      ..writeByte(10)
      ..write(obj.tytSosYanlis)
      ..writeByte(11)
      ..write(obj.tytSosNet)
      ..writeByte(12)
      ..write(obj.tytMatDogru)
      ..writeByte(13)
      ..write(obj.tytMatYanlis)
      ..writeByte(14)
      ..write(obj.tytMatNet)
      ..writeByte(15)
      ..write(obj.tytFenDogru)
      ..writeByte(16)
      ..write(obj.tytFenYanlis)
      ..writeByte(17)
      ..write(obj.tytFenNet)
      ..writeByte(18)
      ..write(obj.aytEdebDogru)
      ..writeByte(19)
      ..write(obj.aytEdebYanlis)
      ..writeByte(20)
      ..write(obj.aytEdebNet)
      ..writeByte(21)
      ..write(obj.aytTarih1Dogru)
      ..writeByte(22)
      ..write(obj.aytTarih1Yanlis)
      ..writeByte(23)
      ..write(obj.aytTarih1Net)
      ..writeByte(24)
      ..write(obj.aytCog1Dogru)
      ..writeByte(25)
      ..write(obj.aytCog1Yanlis)
      ..writeByte(26)
      ..write(obj.aytCog1Net)
      ..writeByte(27)
      ..write(obj.aytTarih2Dogru)
      ..writeByte(28)
      ..write(obj.aytTarih2Yanlis)
      ..writeByte(29)
      ..write(obj.aytTarih2Net)
      ..writeByte(30)
      ..write(obj.aytCog2Dogru)
      ..writeByte(31)
      ..write(obj.aytCog2Yanlis)
      ..writeByte(32)
      ..write(obj.aytCog2Net)
      ..writeByte(33)
      ..write(obj.aytFelDogru)
      ..writeByte(34)
      ..write(obj.aytFelYanlis)
      ..writeByte(35)
      ..write(obj.aytFelNet)
      ..writeByte(36)
      ..write(obj.aytDinDogru)
      ..writeByte(37)
      ..write(obj.aytDinYanlis)
      ..writeByte(38)
      ..write(obj.aytDinNet)
      ..writeByte(39)
      ..write(obj.aytMatDogru)
      ..writeByte(40)
      ..write(obj.aytMatYanlis)
      ..writeByte(41)
      ..write(obj.aytMatNet)
      ..writeByte(42)
      ..write(obj.aytFizDogru)
      ..writeByte(43)
      ..write(obj.aytFizYanlis)
      ..writeByte(44)
      ..write(obj.aytFizNet)
      ..writeByte(45)
      ..write(obj.aytKimDogru)
      ..writeByte(46)
      ..write(obj.aytKimYanlis)
      ..writeByte(47)
      ..write(obj.aytKimNet)
      ..writeByte(48)
      ..write(obj.aytBiyDogru)
      ..writeByte(49)
      ..write(obj.aytBiyYanlis)
      ..writeByte(50)
      ..write(obj.aytBiyNet)
      ..writeByte(51)
      ..write(obj.dilDogru)
      ..writeByte(52)
      ..write(obj.dilYanlis)
      ..writeByte(53)
      ..write(obj.dilNet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
