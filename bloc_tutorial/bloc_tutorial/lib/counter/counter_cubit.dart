import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(10);
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state==0) {
      return;
    }
    emit(state - 1);
  }
}
