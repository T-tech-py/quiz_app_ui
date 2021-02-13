import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final String title;
  final String text;
  final Color color;
  final int delayInMilliseconds;

  const MyCard(
      {@required this.title,
      @required this.text,
      @required this.color,
      this.delayInMilliseconds});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with TickerProviderStateMixin {
  AnimationController _fadeController;
  AnimationController _scaleController;
  Animation<double> curve;

  @override
  void initState() {
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    curve =
        CurvedAnimation(parent: _scaleController, curve: Curves.bounceInOut);

    _fadeController.addListener(() {
      setState(() {});
    });
    _scaleController.addListener(() {
      setState(() {});
    });
//    Timer(Duration(milliseconds: widget.delayInMilliseconds ?? 0), () {
//      _fadeController.forward()..whenComplete(() => _scaleController.forward());
//    });
    _fadeController.forward()
      ..whenComplete(
        () {
          Timer(Duration(milliseconds: widget.delayInMilliseconds ?? 0), () {
            _scaleController.forward();
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _fadeController,
      builder: (context, child) {
        return Container(
          height: size.width / 2 - 45,
          width: size.width / 2 - 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Transform.scale(
            scale: _scaleController.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: widget.color,
                  radius: 20,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class TwoFaceCard extends StatefulWidget {
  final String title;
  final String text;
  final Color color;

  TwoFaceCard({this.title, this.text, this.color});
  @override
  _TwoFaceCardState createState() => _TwoFaceCardState();
}

class _TwoFaceCardState extends State<TwoFaceCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isFlipped = false;
  Offset _offset = Offset.zero;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _controller.addListener(() {
      if (!isFlipped && _controller.value >= 0.5) {
        isFlipped = true;
      }
    });

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform: Matrix4.identity()
            ..rotateY(pi * _controller.value)
            ..setEntry(3, 2, 0.001),
          origin: Offset((size.width / 2 - 45) / 2, 0),
          child: Container(
            height: size.width / 2 - 45, //300
            width: size.width / 2 - 45, //300
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: isFlipped
                ? Transform(
                    origin: Offset((size.width / 2 - 45) / 2, 0),
                    transform: Matrix4.identity()..rotateY(-pi),
                    child: widget.text == 'Cheetah'
                        ? Icon(
                            Icons.check,
                            size: 60,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.close,
                            size: 60,
                            color: Colors.red,
                          ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: widget.color,
                        radius: 20,
                      ),
                      Text(
                        widget.text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      animation: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
