import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

ThemeData themeLight() {
  return ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    canvasColor: Colors.grey.shade200,
    switchTheme: SwitchThemeData(thumbColor: WidgetStatePropertyAll(Colors.yellow), trackColor: WidgetStatePropertyAll(Colors.grey.shade300), thumbIcon: WidgetStatePropertyAll(Icon(Icons.sunny, color: Colors.white,)), trackOutlineColor: WidgetStatePropertyAll(Colors.grey.shade300)),
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black, selectionColor: Colors.black, selectionHandleColor: Colors.black),
            textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold), bodySmall: TextStyle(color: Colors.grey), labelMedium: TextStyle(color: Colors.grey), headlineSmall: TextStyle(color: Colors.white, fontSize: 16), titleLarge: TextStyle(color: Colors.red.shade300, fontSize: 22, fontWeight: FontWeight.bold), titleSmall: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), bodyLarge: TextStyle(color: Colors.black, fontSize: 15), displaySmall: TextStyle(color: Colors.black, fontSize: 14), displayMedium: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold), headlineMedium: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.w500), displayLarge: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold))

  );
}

ThemeData themeDark() {
  return ThemeData(
    canvasColor: Colors.grey.shade900,
        switchTheme: SwitchThemeData(thumbColor: WidgetStatePropertyAll(Colors.black), trackColor: WidgetStatePropertyAll(Colors.grey.shade300), thumbIcon: WidgetStatePropertyAll(Icon(HugeIcons.strokeRoundedMoon02, color: Colors.white,)), trackOutlineColor: WidgetStatePropertyAll(Colors.grey.shade300)),

    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white, selectionColor: Colors.black, selectionHandleColor: Colors.black),
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold), bodyMedium: TextStyle(color: Colors.white), labelMedium: TextStyle(color: Colors.grey), labelSmall: TextStyle(color: Colors.white), bodySmall: TextStyle(color: Colors.grey), headlineSmall: TextStyle(color: Colors.black, fontSize: 16), titleLarge: TextStyle(color: Colors.red.shade300, fontSize: 22, fontWeight: FontWeight.bold), titleSmall: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), bodyLarge: TextStyle(color: Colors.white, fontSize: 15), displaySmall: TextStyle(color: Colors.black, fontSize: 16), headlineMedium: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500), displayMedium: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold), displayLarge: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold))
  );
}