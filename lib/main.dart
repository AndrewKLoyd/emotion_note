import "package:emotions_notes/src/view/home_v.dart";
import "package:flutter/material.dart";
import './src/model/save_load_m.dart';

void main() {
  SaveLoad.load((){});
  runApp(
    MaterialApp(
      home: HomeView(),
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              titleLarge: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              titleMedium: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              titleSmall: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          colorScheme: const ColorScheme.light(
            background: Color.fromARGB(255, 208, 214, 214),
            primary: Color.fromARGB(255, 4, 38, 48),
            secondaryContainer: Color.fromARGB(255, 76, 114, 115),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              counterStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    ),
  );

}
