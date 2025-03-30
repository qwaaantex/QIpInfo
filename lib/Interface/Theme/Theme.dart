import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

ThemeData themeLight() {
  return ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    switchTheme: SwitchThemeData(thumbColor: WidgetStatePropertyAll(Colors.grey.shade400), trackColor: WidgetStatePropertyAll(Colors.grey.shade300), thumbIcon: WidgetStatePropertyAll(Icon(Icons.sunny, color: Colors.white,)), trackOutlineColor: WidgetStatePropertyAll(Colors.grey.shade300)),
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black, selectionColor: Colors.black, selectionHandleColor: Colors.black),
            textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold), bodySmall: TextStyle(color: Colors.grey), labelMedium: TextStyle(color: Colors.grey))

  );
}

ThemeData themeDark() {
  return ThemeData(
        switchTheme: SwitchThemeData(thumbColor: WidgetStatePropertyAll(Colors.grey.shade400), trackColor: WidgetStatePropertyAll(Colors.grey.shade300), thumbIcon: WidgetStatePropertyAll(Icon(HugeIcons.strokeRoundedMoon02, color: Colors.white,)), trackOutlineColor: WidgetStatePropertyAll(Colors.grey.shade300)),

    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black, selectionColor: Colors.black, selectionHandleColor: Colors.black),
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold), bodyMedium: TextStyle(color: Colors.white), labelMedium: TextStyle(color: Colors.grey), labelSmall: TextStyle(color: Colors.white), bodySmall: TextStyle(color: Colors.grey))
  );
}