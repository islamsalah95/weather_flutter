import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int connter = 0;

  void increment() {
    connter++;
    emit(CounterValueChange(connter));
  }

  void decrement() {
    connter--;
    emit(CounterValueChange(connter));
  }

  void reset() {
    connter = 0;
    emit(CounterValueChange(connter));
  }
}
