import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final textColor;
  final fillColor;
  final double textSize;
  final Function callback;

  const CalcButton(
      {Key? key,
      required this.text,
      required this.fillColor,
      required this.textColor,
      required this.textSize,
      required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
        child: TextButton(
          child: Text(text, style: TextStyle(fontSize: textSize)),
          onPressed: () {
            callback(text);
          },
          style: TextButton.styleFrom(
              primary: textColor,
              backgroundColor: fillColor,
              shape: CircleBorder()),
        ),
      ),
    );
  }
}

class EqualButton extends StatelessWidget {
  final String text;
  final textColor;
  final fillColor;
  final double textSize;
  final Function callback;

  const EqualButton(
      {Key? key,
      required this.text,
      required this.fillColor,
      required this.textColor,
      required this.textSize,
      required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      width: 60,
      height: 130,
      child: TextButton(
        child: Text(text, style: TextStyle(fontSize: textSize)),
        onPressed: () {
          callback(text);
        },
        style: TextButton.styleFrom(
          primary: textColor,
        ),
      ),
    );
  }
}
