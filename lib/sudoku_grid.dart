import 'package:flutter/material.dart';
import 'package:sudoku/helpers/utils.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

class SudokuGrid extends StatefulWidget {
  const SudokuGrid({super.key});

  @override
  State<SudokuGrid> createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  final SudokuGenerator _sudoku = SudokuGenerator(emptySquares: 18);

  final List<List<int>> _grid = <List<int>>[];

  @override
  void initState() {
    _grid.addAll(_sudoku.newSudoku);
    int k = 0;
    for (int i = 0; i < _grid.length; i++) {
      for (int j = 1; j < _grid[i].length; j += 2) {
        _grid[i].insert(j, -1);
        k += 1;
      }
    }
    for (int i = 1; i < _grid.length; i += 2) {
      _grid.insert(i, [-1]);
    }
    print(_grid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int rowIndex = 0; rowIndex < _grid.length; rowIndex += 1) Container(),
            ],
          ),
        ),
      ),
    );
  }
}
