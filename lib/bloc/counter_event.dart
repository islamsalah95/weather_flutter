part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

//1
class IncrementCounterEvent extends CounterEvent {}
class DecrementCounterEvent extends CounterEvent {}
class ResetEvent            extends CounterEvent {}

