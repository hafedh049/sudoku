import 'package:flutter/material.dart';
import 'package:sudoku_dart/sudoku_dart.dart';

class SudokuGrid extends StatefulWidget {
  const SudokuGrid({super.key});

  @override
  State<SudokuGrid> createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  final List<int> _grid = Sudoku.generate(Level.easy).puzzle;

  @override
  void initState() {
    for (int index = 0; index < 17 * 17; index += 1) {
      if (index == 5 || index == 11) {}
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_grid);
    return Scaffold(
      body: Row(
        children: <Widget>[
          for (int columnIndex = 0; columnIndex < 17; columnIndex += 1)
            Flexible(
              child: Column(
                children: <Widget>[
                  for (int itemIndex = 0; itemIndex < 17; itemIndex += 1) Container(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
