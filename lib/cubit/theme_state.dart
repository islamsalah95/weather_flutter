part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}
class ThemeChange extends ThemeState {
  final String value;
  ThemeChange(this.value);
}
