import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/helpers/utils.dart';

class Arrow extends StatefulWidget {
  const Arrow({super.key, required this.arrow});
  final IconData arrow;
  @override
  State<Arrow> createState() => _ArrowState();
}

class _ArrowState extends State<Arrow> {
  bool _gesture = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (LongPressDownDetails details) {
        _gesture = true;
      },
      onLongPressUp: () {
        _gesture = false;
      },
      onTapUp: (TapUpDetails details) {
        _gesture = false;
      },
      onTapDown: (TapDownDetails details) {
        _gesture = true;
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border.all(width: .5, color: transparent), shape: BoxShape.circle),
        child: Icon(widget.arrow, size: 15, color: white),
      ),
    );
  }
}
