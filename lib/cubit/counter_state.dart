part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}


class CounterValueChange extends CounterState {
  final int value;
  CounterValueChange(this.value);
}
