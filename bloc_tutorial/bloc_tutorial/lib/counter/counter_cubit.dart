import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(10);
  void increment() {
    print('before: $state');
    emit(state + 1);
    print('after: $state');
  }
}
