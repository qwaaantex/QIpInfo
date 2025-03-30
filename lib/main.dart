import 'package:QIpInfo/Interface/Screens/QIpInfoMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences storage = await SharedPreferences.getInstance();
  final theme = storage.getBool("_theme");
  await dotenv.load();

  runApp(QIpInfoMain(theme: theme,));
}