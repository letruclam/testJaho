import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextNormal extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double? height;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final FontStyle fontStyle;

  const TextNormal(this.text,
      {Key? key ,
      this.textColor = Colors.black,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      this.height = 1.8,
      this.textAlign = TextAlign.start,
      this.decoration = TextDecoration.none,
      this.fontStyle = FontStyle.normal}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: text));
      },
      child: Text(
        text,
        style: TextStyle(
            fontWeight: fontWeight,
            color: textColor,
            fontSize: fontSize,
            height: height,
            decoration: decoration,
            fontStyle: fontStyle),
        textAlign: textAlign,
      ),
    );
  }
}
