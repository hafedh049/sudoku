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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            for (int rowIndex = 0; rowIndex < 9; rowIndex += 1)
              Flexible(
                child: Row(
                  children: <Widget>[
                    for (int columnIndex = 0; columnIndex < 9; columnIndex += 1)
                      _grid[rowIndex][columnIndex] != 0
                          ? Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(shape: BoxShape.circle, color: gray),
                                        child: Center(
                                          child: Text(
                                            _grid[rowIndex][columnIndex].toString(),
                                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      !(columnIndex % 3 == 0) ? Container(width: 1, height: 20, color: gray) : Container(width: 1, height: 20, color: Colors.yellow),
                                    ],
                                  ),
                                  Container(width: 20, height: 1, color: gray),
                                ],
                              ),
                            )
                          : Expanded(
                              child: Container(width: 20, height: 20),
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
