import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QIpInfoBloc extends Bloc<QIpInfoBlocState, dynamic> {
  QIpInfoBloc(dynamic userIp) : super(userIp) {
    final dio = Dio();
    on<QIpInfoBlocUserInfo>((event, emit) async {
      try {
        final data = await dio.get("https://ipinfo.io/${event.controller.text}/geo");
        emit(data.data["org"]);
      } catch (e) {
        emit(null);
      }
    });
  }

}