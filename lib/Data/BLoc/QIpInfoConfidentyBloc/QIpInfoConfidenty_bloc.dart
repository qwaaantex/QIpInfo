
import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_events.dart';
import 'package:QIpInfo/Data/BLoc/QIpInfoConfidentyBloc/QIpInfoConfidenty_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QIpInfoConfidentyBloc  extends Bloc<QIpInfoConfiDentyState, QIpInfoConfidentyMetrics> {
  QIpInfoConfidentyBloc() : super (QIpInfoConfidentyMetrics(index: 0)) {
    on<QIpInfoConfidentyChangeEvent>(changeEvent);
  }
  void changeEvent (QIpInfoConfidentyChangeEvent event, Emitter<QIpInfoConfidentyMetrics> emit) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    emit(QIpInfoConfidentyMetrics(index: event.index));
    storage.setInt("_confidenty", event.index);
    }
}