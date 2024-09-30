part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

//2
class CounterValueChange extends CounterState {
  final int value;
  CounterValueChange(this.value);
}
