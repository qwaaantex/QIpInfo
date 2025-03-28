import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class QProvider with ChangeNotifier {
  dynamic _userIp;
  dynamic get userIp => _userIp;
  
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
      _userIp = 'null';
    }
    
  }
}