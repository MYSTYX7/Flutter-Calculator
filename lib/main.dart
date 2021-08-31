import 'package:flutter/material.dart';
import './widgets/calcButtons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key? key}) : super(key: key);
  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = '';
  dynamic _expression = '';

  numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "TitilliumWeb",
      ),
      title: 'Calculator',
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: Text(
                      _history,
                      style: TextStyle(fontSize: 30.0, color: Colors.white38),
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22.0, bottom: 30.0),
                    child: Text(
                      _expression,
                      style: TextStyle(fontSize: 60.0),
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                const Divider(
                  height: 10,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Expanded(
                //         child: CalcButton(
                //       text: 'sin',
                //       textColor: Colors.red,
                //       fillColor: Colors.grey,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: 'cos',
                //       textColor: Colors.red,
                //       fillColor: Colors.grey,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: 'tan',
                //       textColor: Colors.red,
                //       fillColor: Colors.grey,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: 'ln',
                //       textColor: Colors.black,
                //       fillColor: Colors.white,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: 'log',
                //       textColor: Colors.black,
                //       fillColor: Colors.white,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: '!',
                //       textColor: Colors.black,
                //       fillColor: Colors.white,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     // Expanded(
                //     //     child: CalcButton(
                //     //   text: 'π',
                //     //   textColor: Colors.white,
                //     //   fillColor: Colors.grey,
                //     //   textSize: 20.0,
                //     //   callback: pi,
                //     // )),
                //     TextButton(
                //         onPressed: () {
                //           setState(() {
                //          _expression += pi;
                //             });
                //         },
                //         child: Text("π")),
                //     Expanded(
                //         child: CalcButton(
                //       text: 'e',
                //       textColor: Colors.white,
                //       fillColor: Colors.grey,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: '√',
                //       textColor: Colors.black,
                //       fillColor: Colors.white,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: '^',
                //       textColor: Colors.black,
                //       fillColor: Colors.white,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: '(',
                //       textColor: Colors.black,
                //       fillColor: Colors.white,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //     Expanded(
                //         child: CalcButton(
                //       text: ')',
                //       textColor: Colors.black,
                //       fillColor: Colors.white,
                //       textSize: 20.0,
                //       callback: numClick,
                //     )),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      textColor: Colors.white,
                      fillColor: Colors.transparent,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '4',
                      textColor: Colors.white,
                      fillColor: Colors.transparent,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '1',
                      textColor: Colors.white,
                      fillColor: Colors.transparent,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '.',
                      textColor: Colors.black,
                      fillColor: Colors.white,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: 'AC',
                      textColor: Colors.white,
                      fillColor: Colors.grey,
                      textSize: 30.0,
                      callback: allClear,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      textColor: Colors.white,
                      fillColor: Colors.transparent,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      textColor: Colors.white,
                      fillColor: Colors.transparent,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      textColor: Colors.white,
                      fillColor: Colors.transparent,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '*',
                      textColor: Colors.black,
                      fillColor: Colors.white,
                      textSize: 30.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: 'C',
                      textColor: Colors.white,
                      fillColor: Colors.grey,
                      textSize: 30.0,
                      callback: clear,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: <Widget>[
                            CalcButton(
                              text: '1',
                              textColor: Colors.white,
                              fillColor: Colors.transparent,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            CalcButton(
                              text: '2',
                              textColor: Colors.white,
                              fillColor: Colors.transparent,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            CalcButton(
                              text: '3',
                              textColor: Colors.white,
                              fillColor: Colors.transparent,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            CalcButton(
                              text: '-',
                              textColor: Colors.black,
                              fillColor: Colors.white,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            // EqualButton(
                            //   text: '=',
                            //   textColor: Colors.black,
                            //   fillColor: Colors.transparent,
                            //   textSize: 30.0,
                            //   callback: evaluate,
                            // ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            CalcButton(
                              text: '.',
                              textColor: Colors.white,
                              fillColor: Colors.transparent,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            CalcButton(
                              text: '0',
                              textColor: Colors.white,
                              fillColor: Colors.transparent,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            CalcButton(
                              text: '%',
                              textColor: Colors.black,
                              fillColor: Colors.white,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            CalcButton(
                              text: '+',
                              textColor: Colors.black,
                              fillColor: Colors.white,
                              textSize: 30.0,
                              callback: numClick,
                            ),
                            // CalcButton(
                            //   text: '=',
                            //   textColor: Colors.white,
                            //   fillColor: Colors.black38,
                            //   textSize: 30.0,
                            //   callback: evaluate,
                            // ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        EqualButton(
                          text: '=',
                          textColor: Colors.black,
                          fillColor: Colors.red,
                          textSize: 30.0,
                          callback: evaluate,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
