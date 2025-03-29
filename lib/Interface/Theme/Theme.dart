import 'package:flutter/material.dart';

ThemeData themeLight() {
  return ThemeData(
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black, selectionColor: Colors.black, selectionHandleColor: Colors.black),
            textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold))

  );
}

ThemeData themeDark() {
  return ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black, selectionColor: Colors.black, selectionHandleColor: Colors.black),
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold))
  );
}