import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'QIpInfoThemerBloc_events..dart';
part 'QIpInfoThemerBloc_state.dart';

class QIpInfoThemerBlocBloc extends Bloc<QIpInfoThemerBlocState, bool> {
  QIpInfoThemerBlocBloc(bool theme) : super(theme) {
    on<QIpInfoThemerBlocEvent>((event, emit) async {
      SharedPreferences storage = await SharedPreferences.getInstance();
      emit(!state);
      storage.setBool("_theme", state);
    });
  }
}
