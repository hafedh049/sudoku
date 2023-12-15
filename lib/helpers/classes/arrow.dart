import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';
import 'package:sudoku/helpers/utils.dart';

class Arrow extends StatefulWidget {
  const Arrow({super.key, required this.arrow});
  final IconData arrow;
  @override
  State<Arrow> createState() => _ArrowState();
}

class _ArrowState extends State<Arrow> {
  @override
  Widget build(BuildContext context) {
    return PrettyWaveButton(
      onPressed: () {},
      borderRadius: 50,
      backgroundColor: transparent,
      verticalPadding: 8,
      horizontalPadding: 8,
      duration: 200.ms,
      waveLength: 16,
      child: Icon(
        widget.arrow,
        size: 15,
        color: white,
      ),
    );
  }
}
