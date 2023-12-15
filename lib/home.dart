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
  final List<String> _levels = <String>["Beginner", "Easy", "Medium", "Hard", "Extreme"];
  final PageController _levelsController = PageController();

  @override
  void dispose() {
    _levelsController.dispose();
    super.dispose();
  }

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
                        const Arrow(arrow: FontAwesome.chevron_left),
                        SizedBox(
                          width: 100,
                          child: PageView.builder(
                            controller: _levelsController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) => Center(child: Text(_levels[index])),
                          ),
                        ),
                        const Arrow(arrow: FontAwesome.chevron_right),
                      ],
                    ),
                  ),
                  const
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
