import 'package:expense/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.pink);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.pink,
  brightness: Brightness.dark,
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: CardTheme(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        color: Colors.pink[100]!.withOpacity(0.25),
      ),
      textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.pink[100],
        foregroundColor: kColorScheme.onPrimaryContainer,
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.pink[100],
        foregroundColor: kColorScheme.onPrimaryContainer,
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.secondaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          )),
    ),
    home: const Expenses(),
    themeMode: ThemeMode.system,
  ));
}
