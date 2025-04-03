import 'package:QIpInfo/Interface/Screens/QIpInfoMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences storage = await SharedPreferences.getInstance();
  final bool? theme = storage.getBool("_theme") ?? false;
  final int? confidenty = storage.getInt("_confidenty") ?? 1;
  await dotenv.load();

  runApp(QIpInfoMain(theme: theme, index: confidenty,));
}