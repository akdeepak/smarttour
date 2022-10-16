
import 'package:flutter/cupertino.dart';

class CustomColumn extends StatelessWidget {
  final String text;
  final Widget? child;
  CustomColumn({required this.text, this.child});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18),
        ),

      ],
    );
  }
}