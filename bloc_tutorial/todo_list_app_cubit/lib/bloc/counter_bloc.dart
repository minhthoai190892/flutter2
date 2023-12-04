import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBlocs extends Bloc<CounterEvents, CounterStates>{
  CounterBlocs():super(InitialState()){
    on<Increment>((event, emit){
      emit(CounterStates(counter: state.counter+1));
    });

    on<Decrement>((event, emit){
      emit(CounterStates(counter:state.counter-1));
    });
  }
}