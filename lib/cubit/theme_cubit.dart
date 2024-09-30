import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  String value = "off";
  void changeTheme() {
    if (value == "off") {
      value = "on";
    }else{
      value = "off";
    }
    emit(ThemeChange(value));
  }
}
