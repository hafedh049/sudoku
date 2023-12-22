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
        k += 1;
        _grid[i].insert(j, k == 3 || k == 6 ? -2 : -1);
      }
    }

    k = 0;

    for (int i = 1; i < _grid.length; i += 2) {
      k += 1;
      _grid.insert(i, k == 3 || k == 6 ? [for (int _ = 0; _ < 17; _++) -2] : [for (int _ = 0; _ < 17; _++) -1]);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_grid);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int columnIndex = 0; columnIndex < _grid.length; columnIndex += 1)
                columnIndex % 2 != 0
                    ? _grid[columnIndex][0] == -2
                        ? Column(mainAxisSize: MainAxisSize.min, children: <Widget>[Container(width: 2, height: 500, color: Colors.yellow)])
                        : Column(mainAxisSize: MainAxisSize.min, children: <Widget>[for (int rowIndex = 0; rowIndex < 17; rowIndex += 1) Container(width: 1, height: 20, color: gray)])
                    : Expanded(
                        child: Column(
                          children: <Widget>[
                            for (int rowIndex = 0; rowIndex < 17; rowIndex += 1)
                              _grid[rowIndex][columnIndex] == -1
                                  ? Expanded(child: Container(width: 20, height: 1, color: gray))
                                  : _grid[rowIndex][columnIndex] == -2
                                      ? Expanded(child: Container(height: 1, width: 20, color: Colors.yellow))
                                      : _grid[rowIndex][columnIndex] == 0
                                          ? const SizedBox()
                                          : Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: const BoxDecoration(shape: BoxShape.circle, color: gray),
                                                child: Center(child: Text(_grid[rowIndex][columnIndex].toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
                                              ),
                                            ),
                          ],
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
