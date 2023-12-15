import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: const Home(), theme: ThemeData.dark());
  }
}
