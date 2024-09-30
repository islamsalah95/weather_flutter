import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int value = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementCounterEvent) {
        value++;
        emit(CounterValueChange(value));
      } 
      else if (event is DecrementCounterEvent){
         value--;
        emit(CounterValueChange(value));
      } 
      else if (event is ResetEvent){
         value=0;
        emit(CounterValueChange(value));
      } 
      else{
        value=0;
        emit(CounterInitial());
      }
    });
  }
}
