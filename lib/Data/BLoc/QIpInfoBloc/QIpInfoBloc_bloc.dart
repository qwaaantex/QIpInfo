import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_events.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoBloc/QIpInfoBloc_state.dart';
import 'package:QIpInfo/Data/Models/QIpInfoModel/QIpInfoModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QIpInfoBloc extends Bloc<QIpInfoBlocState, QIpInfoModel> {
  QIpInfoBloc() : super(QIpInfoModel())
   {
    final dio = Dio();
    on<QIpInfoBlocUserInfo>((event, emit) async {
      try {
        await dotenv.load();
        final data = await dio.get("http://ipwho.is/${event.controller}");
        QIpInfoModel model = QIpInfoModel.fromJson(data.data);
        emit(QIpInfoModel(region: model.region, city: model.region, country: model.country, postal: model.postal, timezone: model.timezone, ip: model.ip, type: model.type, continent: model.continent, continentCode: model.continentCode, callingCode: model.callingCode, capital: model.capital, connection: model.connection, longitude: model.longitude, latitude: model.latitude, borders: model.borders, regionCode: model.regionCode, flag: model.flag, success: model.success));
      } catch (e) {
        emit(QIpInfoModel(success: false));
      }
    });
    on<QIpInfoBlocRemoveAll>((event, emit) {
      emit(QIpInfoModel(success: null));
    });
  }

}