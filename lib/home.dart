import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sudoku/helpers/classes/arrow.dart';
import 'package:sudoku/helpers/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Row(
              children: <Widget>[
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesome.palette, size: 20, color: gold),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: gold),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(FontAwesome.hashtag, size: 64, color: dark),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: <Widget>[
Arrow(arrow: FontAwesome.chevron_left),
                        PageView.builder(itemCount: 5,itemBuilder: (BuildContext context,int index) => ,),Arrow(arrow: FontAwesome.chevron_right),],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
