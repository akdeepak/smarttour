import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({Key? key, this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      textAlign: TextAlign.center,
      style:TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size ==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400,
      )
    );
  }
}
