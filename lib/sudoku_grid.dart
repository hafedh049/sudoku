import 'package:flutter/material.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

class SudokuGrid extends StatefulWidget {
  const SudokuGrid({super.key});

  @override
  State<SudokuGrid> createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  final SudokuGenerator _sudoku = SudokuGenerator(emptySquares: 24);

  final List<List<int>> _grid = []; // Sudoku.generate(Level.easy).puzzle;

  @override
  void initState() {
    _grid.addAll(_sudoku.newSudoku);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          for (int rowIndex = 0; rowIndex < 9; rowIndex += 1)
            Flexible(
              child: Row(
                children: <Widget>[
                  for (int itemIndex = 0; itemIndex < 9; itemIndex += 1) Container(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
