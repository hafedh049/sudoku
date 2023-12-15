import 'package:flutter/material.dart';
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
      borderRadius : 50,
   backgroundColor  :tra,
  double verticalPadding = s14,
  double horizontalPadding = s42,
  Duration duration = duration1000,
  Curve curve = Curves.easeInOut,
  double waveLength = s6,
      child: Icon(
        widget.arrow,
        size: 15,
        color: white,
      ),
    );
  }
}
