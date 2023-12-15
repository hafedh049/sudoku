import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sudoku/helpers/utils.dart';

class Buttoned extends StatefulWidget {
  const Buttoned({super.key, required this.text, required this.callback, this.fontSize = 16});
  final String text;
  final void Function() callback;
  final double fontSize;
  @override
  State<Buttoned> createState() => _ButtonedState();
}

class _ButtonedState extends State<Buttoned> {
  bool _borderState = false;
  bool _colorState = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (LongPressDownDetails details) async {
        setState(() => _colorState = true);
        await Future.delayed(300.ms);
        setState(() => _borderState = true);
      },
      onLongPressUp: () async {
        setState(() => _colorState = false);
        await Future.delayed(300.ms);
        setState(() => _borderState = false);
        widget.callback();
      },
      onTapUp: (TapUpDetails details) async {
        setState(() => _colorState = false);
        await Future.delayed(700.ms);
        setState(() => _borderState = false);
        widget.callback();
      },
      onTapDown: (TapDownDetails details) async {
        setState(() => _colorState = true);
        await Future.delayed(300.ms);
        setState(() => _borderState = true);
      },
      child: AnimatedContainer(
        duration: 500.ms,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(border: Border.all(width: 1, color: _borderState ? gold : transparent), borderRadius: BorderRadius.circular(15), color: _colorState ? gold : transparent),
        child: Center(child: Text(widget.text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: widget.fontSize, color: _colorState ? dark : null))),
      ),
    );
  }
}
