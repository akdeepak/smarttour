import 'package:flutter/cupertino.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class TestExpandedWidget extends StatefulWidget {
  final String text;
  final int maxLines;
  const TestExpandedWidget({
    Key? key,
    required this.text, required this.maxLines
  }) : super(key: key);

  @override
  State<TestExpandedWidget> createState() => _TestExpandedWidgetState();
}

class _TestExpandedWidgetState extends State<TestExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ExpandableText(
          widget.text,
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: widget.maxLines,
          linkColor: Colors.blue,
        ),
      ],
    ),
    );
  }
}
