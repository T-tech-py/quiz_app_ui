import 'package:flutter/material.dart';
import 'mycard.dart';

class AnswerScreen extends StatefulWidget {
  final String title;
  final String text;
  final Color color;
  final int tagNumber;

  const AnswerScreen(
      {@required this.title,
      @required this.text,
      @required this.color,
      @required this.tagNumber});

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff783bff),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xff783bff),
        padding: EdgeInsets.fromLTRB(20, kToolbarHeight + 10, 20, 0),
        child: Center(
          child: Hero(
            tag: widget.tagNumber,
            child: TwoFaceCard(
              title: widget.title,
              text: widget.text,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
