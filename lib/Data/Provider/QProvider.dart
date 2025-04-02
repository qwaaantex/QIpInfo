import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class QProvider with ChangeNotifier {
  dynamic _userIp;
  bool _isDarkTheme = ThemeMode.system == ThemeMode.dark ? true : false ;
  final TextEditingController _controller = TextEditingController();
  dynamic get userIp => _userIp;
  bool get isDarkTheme => _isDarkTheme;
  TextEditingController get controller => _controller;
  
  QProvider() {
    loadUserIp();
  }

  Future<void> loadUserIp() async {
    try {
    final dio = Dio();
    Response userIpLogic =     await dio.get("https://api.ipify.org?format=json");
    final response = userIpLogic.data['ip'];
    _userIp = response;
    notifyListeners();
    } catch (e) {
      _userIp = null;
    }
  }

  void clearController() {
    _controller.clear();
    notifyListeners();
  }

}