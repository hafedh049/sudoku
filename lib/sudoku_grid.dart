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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_grid);
    return Scaffold(
      body: Column(
        children: <Widget>[
          for (int rowIndex = 0; rowIndex < 9; rowIndex += 1)
            Flexible(
              child: Row(
                children: <Widget>[
                  for (int columnIndex = 0; columnIndex < 9; columnIndex += 1)
                    _grid[rowIndex][columnIndex] != 0
                        ? Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: gray),
                            child: Text(_grid[rowIndex][columnIndex].toString()),
                          )
                        : Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: gray),
                            child: Text(_grid[rowIndex][columnIndex].toString()),
                          ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
