
import 'dart:math';

import 'package:QIpInfo/Data/BLoc/QIpInfoFeedBackCubit/QIpInfoFeedBack_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QIpInfoFeedBackCubit extends Cubit<dynamic> {
  QIpInfoFeedBackCubit() : super(QIpInfoFeedBackState(succes: null));

  Future<void>sendReview(String review) async {
    Dio dio = Dio();

    try {
    await dio.post("https://67efadb02a80b06b88955094.mockapi.io/Data", 
    data: {
      'userId': Random().nextInt(1000000000),
      'review': review
    });
    emit(QIpInfoFeedBackState(succes: true));
    } catch (e) {
      print(e.toString());
      emit(QIpInfoFeedBackState(succes: false));
    }
    
  }
}