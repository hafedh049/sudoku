import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sudoku/helpers/utils.dart';

class Arrow extends StatefulWidget {
  const Arrow({super.key, required this.arrow});
  final IconData arrow;
  @override
  State<Arrow> createState() => _ArrowState();
}

class _ArrowState extends State<Arrow> {
  bool _borderState = false;
  bool _colorState = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (LongPressStartDetails details) async {
        setState(() => _borderState = true);
        await Future.delayed(300.ms);
        setState(() => _colorState = true);
      },
      onLongPressEnd: (LongPressEndDetails details) async {
        setState(() => _borderState = false);
        await Future.delayed(700.ms);
        setState(() => _colorState = false);
      },
      onTapCancel: () async {
        setState(() => _borderState = false);
        await Future.delayed(700.ms);
        setState(() => _colorState = false);
      },
      onTapDown: (TapDownDetails details) async {
        setState(() => _borderState = true);
        await Future.delayed(300.ms);
        setState(() => _colorState = true);
      },
      child: AnimatedContainer(
        duration: 300.ms,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border.all(width: 1, color: _borderState ? gold : transparent), shape: BoxShape.circle, color: _colorState ? gold : transparent),
        child: Icon(widget.arrow, size: 15, color: _borderState ? dark : white),
      ),
    );
  }
}
