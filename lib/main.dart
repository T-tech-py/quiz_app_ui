import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_ui/mycard.dart';
import 'answer_screen.dart';

void main() {
  runApp(QuizUI());
}

class QuizUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//Color(0xff3801b1)
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _textAnimationController;
  AnimationController _timerController;
  AnimationController _controller1;
  AnimationController _controller2;
  AnimationController _controller3;
  AnimationController _controller4;

  AnimationController _scaleController1;
  AnimationController _scaleController2;
  AnimationController _scaleController3;
  AnimationController _scaleController4;

  AnimationController _fadeController1;
  AnimationController _fadeController2;
  AnimationController _fadeController3;
  AnimationController _fadeController4;

  @override
  void initState() {
    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _timerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10000),
    );
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      lowerBound: 0.75,
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      lowerBound: 0.75,
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      lowerBound: 0.75,
    );
    _controller4 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      lowerBound: 0.75,

      ////////
    );
    _scaleController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _scaleController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _scaleController3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _scaleController4 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fadeController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fadeController3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fadeController4 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _textAnimationController.addListener(() {
      print(_timerController.value);
      setState(() {});
    });
    _textAnimationController.forward();

    _controller1.addListener(() {
      setState(() {});
    });
    _controller2.addListener(() {
      setState(() {});
    });
    _controller3.addListener(() {
      setState(() {});
    });
    _controller4.addListener(() {
      setState(() {});
    });

    _timerController.addListener(() {
      setState(() {});
    });

    //////
    _fadeController1.addListener(() {
      setState(() {});
    });
    _fadeController2.addListener(() {
      setState(() {});
    });
    _fadeController3.addListener(() {
      setState(() {});
    });
    _fadeController4.addListener(() {
      setState(() {});
    });

    _controller1.forward()
      ..whenComplete(
        () => _controller2.forward()
          ..whenComplete(
            () => _controller3.forward()
              ..whenComplete(
                () => _controller4.forward(),
              ),
          ),
      );
    _fadeController1.forward()
      ..whenComplete(
        () => _fadeController2.forward()
          ..whenComplete(
            () => _fadeController3.forward()
              ..whenComplete(
                () => _fadeController4.forward()
                  ..whenComplete(() => _timerController.forward()),
              ),
          ),
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xff783bff),
            padding: EdgeInsets.fromLTRB(20, kToolbarHeight + 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.heart_solid,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Oh My Quiz!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Transform.translate(
                  offset:
                      Offset(0, 200 - (_textAnimationController.value * 200)),
                  child: Opacity(
                    opacity: _textAnimationController.value,
                    child: Text(
                      'What is the fastest animal in the world?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Opacity(
                  opacity: _fadeController4.value,
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 45,
                          left: 37,
                          child: Text(
                            '0:${(10 - (_timerController.value * 10)).floor().toString().padLeft(2, '0')}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.purple,
                            value: _timerController.value,
                            strokeWidth: 10 - (_timerController.value * 10),
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
//            Container(
//              height: 120.0,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                border: Border.all(
//                  color: Colors.white,
//                  width: 10,
//                ),
//              ),
//            ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Transform.rotate(
                      angle: -1 * _controller1.value * 2 * math.pi,
                      child: Transform.scale(
                        scale: _fadeController1.value,
                        child: Opacity(
                          opacity: _fadeController1.value,
                          child: Hero(
                            tag: 4,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return AnswerScreen(
                                        title: 'A',
                                        text: 'Turtle',
                                        tagNumber: 4,
                                        color: Colors.yellow[700]);
                                  }),
                                );
                              },
                              child: MyCard(
                                  delayInMilliseconds: 0,
                                  title: 'A',
                                  text: 'Turtle',
                                  color: Colors.yellow[700]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: -1 * _controller2.value * 2 * math.pi,
                      child: Transform.scale(
                        scale: _fadeController2.value,
                        child: Opacity(
                          opacity: _fadeController2.value,
                          child: Hero(
                            tag: 3,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return AnswerScreen(
                                        title: 'B',
                                        text: 'Cheetah',
                                        tagNumber: 3,
                                        color: Colors.lightBlue[400]);
                                  }),
                                );
                              },
                              child: MyCard(
                                  delayInMilliseconds: 200,
                                  title: 'B',
                                  text: 'Cheetah',
                                  color: Colors.lightBlue[400]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Transform.rotate(
                      angle: -1 * _controller3.value * 2 * math.pi,
                      child: Transform.scale(
                        scale: _fadeController3.value,
                        child: Opacity(
                          opacity: _fadeController3.value,
                          child: Hero(
                            tag: 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return AnswerScreen(
                                        title: 'C',
                                        text: 'Rabbit',
                                        tagNumber: 2,
                                        color: Colors.green[400]);
                                  }),
                                );
                              },
                              child: MyCard(
                                  delayInMilliseconds: 400,
                                  title: 'C',
                                  text: 'Rabbit',
                                  color: Colors.green[400]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: -1 * _controller4.value * 2 * math.pi,
                      child: Transform.scale(
                        scale: _fadeController4.value,
                        child: Opacity(
                          opacity: _fadeController4.value,
                          child: Hero(
                            tag: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return AnswerScreen(
                                        title: 'D',
                                        text: 'Leopard',
                                        tagNumber: 1,
                                        color: Colors.red[400]);
                                  }),
                                );
                              },
                              child: MyCard(
                                  delayInMilliseconds: 600,
                                  title: 'D',
                                  text: 'Leopard',
                                  color: Colors.red[400]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
