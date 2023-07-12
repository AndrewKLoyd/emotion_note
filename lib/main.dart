import "package:emotions_notes/src/view/home_v.dart";
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: HomeView(),
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            background: Color.fromARGB(255, 208, 214, 214),
            primary: Color.fromARGB(255, 4, 38, 48),
            secondaryContainer: Color.fromARGB(255, 76, 114, 115),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 2))),
    ),
  );
}
