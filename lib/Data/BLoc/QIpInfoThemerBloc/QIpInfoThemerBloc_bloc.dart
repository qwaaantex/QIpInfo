import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'QIpInfoThemerBloc_events..dart';
part 'QIpInfoThemerBloc_state.dart';

class QIpInfoThemerBlocBloc extends Cubit<bool> {
  QIpInfoThemerBlocBloc(bool? theme) : super(theme ?? false);
  void changeTheme() async {
      SharedPreferences storage = await SharedPreferences.getInstance();
      emit(!state);
      storage.setBool("_theme", state);
    }
}
