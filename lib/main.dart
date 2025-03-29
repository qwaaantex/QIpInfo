import 'package:QIpInfo/Interface/Screens/QIpInfoMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(QIpInfoMain());
}