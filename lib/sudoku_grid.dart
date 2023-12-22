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
    print(_grid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int columnIndex = 0; columnIndex < _grid.length; columnIndex += 1)
                _grid[columnIndex].every((int element) => element == -2)
                    ? Column(mainAxisSize: MainAxisSize.min, children: <Widget>[Flexible(child: Container(width: 2, color: Colors.yellow))])
                    : _grid[columnIndex].every((int element) => element == -1)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (int rowIndex = 0; rowIndex < 17; rowIndex += 1) const Flexible(child: Divider(thickness: 1, height: 1, color: gray, indent: 5, endIndent: 5)),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (int rowIndex = 0; rowIndex < 17; rowIndex += 1)
                                _grid[rowIndex][columnIndex] == 0
                                    ? const SizedBox(width: 20, height: 20)
                                    : Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(shape: BoxShape.circle, color: gray),
                                        child: Center(child: Text(_grid[rowIndex][columnIndex].toString())),
                                      ),
                            ],
                          ),
            ],
          ),
        ),
      ),
    );
  }
}
