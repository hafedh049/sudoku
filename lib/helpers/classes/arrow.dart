import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';

class Arrow extends StatefulWidget {
  const Arrow({super.key,required this.arrow});
  final IconData arrow;
  @override
  State<Arrow> createState() => _ArrowState();
}

class _ArrowState extends State<Arrow> {
  @override
  Widget build(BuildContext context) {
    return const PrettyWaveButton(onPressed: () {  }, child: Icon(FontAwesome.),);
  }
}
