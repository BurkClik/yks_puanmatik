import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SinavContent extends StatefulWidget {
  final Widget exams;

  const SinavContent({Key key, this.exams}) : super(key: key);
  @override
  _SinavContentState createState() => _SinavContentState();
}

class _SinavContentState extends State<SinavContent> {
  double tytPuan(double tr, double sos, double mat, double fen) {
    return (tr * 3.25 + sos * 3.5 + mat * 3.25 + fen * 3.5 + 100);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [widget.exams],
    );
  }
}
