import 'package:flutter/material.dart';

class SudokuGrid extends StatefulWidget {
  const SudokuGrid({super.key});

  @override
  State<SudokuGrid> createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  final List<String> _items = List<String>.generate(10, (int index) => index.toString())..addAll(const <String>["cell_separator","column_separator","empty_cell"]);
  final List<String> _grid = List.generate(17*17, (int index) => "");

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          for (int columnIndex = 0; columnIndex < 17; columnIndex += 1)
            Flexible(
              child: Column(
                children: <Widget>[for (int itemIndex = 0 ; itemIndex < 17 ; itemIndex +=1)
                ],
              ),
            ),
        ],
      ),
    );
  }
}
