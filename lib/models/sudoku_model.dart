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

  bool solveSudoku() {
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

        if (solveSudoku()) {
          return true;
        }

        grid[row][col] = 0;
      }
    }

    return false;
  }

  bool solve() {
    if (solveSudoku()) {
      printGrid();
      return true;
    } else {
      print("No solution exists");
      return false;
    }
  }

  void printGrid() {
    for (int i = 0; i < n; i++) {
      print(grid[i]);
    }
  }

  void generate() {
    // Code to generate a Sudoku puzzle
    // Implement your own logic to generate a puzzle
  }
}

void main() {
  Sudoku sudoku = Sudoku();
  sudoku.solve();
}
