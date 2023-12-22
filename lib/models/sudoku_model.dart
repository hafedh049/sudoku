import 'dart:math';

class Sudoku {
  late List<List<int>> grid;
  final int n = 9;

  Sudoku() {
    grid = List.generate(n, (_) => List.filled(n, 0));
  }

  bool isSafe(int row, int col, int num) {
    for (int i = 0; i < n; i++) {
      if (grid[row][i] == num || grid[i][col] == num) {
        return false;
      }
    }

    int subgridSize = sqrt(n).toInt();
    int startRow = (row ~/ subgridSize) * subgridSize;
    int startCol = (col ~/ subgridSize) * subgridSize;

    for (int i = startRow; i < startRow + subgridSize; i++) {
      for (int j = startCol; j < startCol + subgridSize; j++) {
        if (grid[i][j] == num) {
          return false;
        }
      }
    }

    return true;
  }

  bool solve() {
    int row = -1;
    int col = -1;
    bool isEmpty = true;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 0) {
          row = i;
          col = j;
          isEmpty = false;
          break;
        }
      }
      if (!isEmpty) {
        break;
      }
    }

    if (isEmpty) {
      return true;
    }

    for (int num = 1; num <= n; num++) {
      if (isSafe(row, col, num)) {
        grid[row][col] = num;

        if (solve()) {
          return true;
        }

        grid[row][col] = 0;
      }
    }

    return false;
  }

  bool generate() {
    return _fillGrid(0, 0);
  }

  bool _fillGrid(int row, int col) {
    if (row == 9) {
      // All rows filled (base case for recursion)
      return true;
    }

    var nextRow = col == 8 ? row + 1 : row;
    var nextCol = (col + 1) % 9;

    var numbers = List.generate(9, (index) => index + 1)..shuffle(); // Randomize numbers for each row

    for (var num in numbers) {
      if (isSafe(row, col, num)) {
        grid[row][col] = num;

        if (_fillGrid(nextRow, nextCol)) {
          return true;
        }

        grid[row][col] = 0; // Backtrack if the current arrangement is not correct
      }
    }
    return false;
  }
}
