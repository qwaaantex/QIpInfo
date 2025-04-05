import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class QProvider with ChangeNotifier {
  dynamic _userIp;
  final String _linkDownload = 'https://github.com/qwaaantex/QIpInfo';
  final Uri _linkToVisit = Uri.parse('https://t.me/qwaaantex');
  final Uri _ErrorLink = Uri.parse("https://github.com/qwaaantex/QIpInfo/issues");
  final bool _isDarkTheme = ThemeMode.system == ThemeMode.dark ? true : false ;
  final TextEditingController _controller = TextEditingController();
  dynamic get userIp => _userIp;
  bool get isDarkTheme => _isDarkTheme;
  Uri get ErrorLink => _ErrorLink;
  String get linkDownload => _linkDownload;
  Uri get linkToVisit => _linkToVisit;
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
      notifyListeners();
    }
  }

  void clearController() {
    _controller.clear();
    notifyListeners();
  }

}