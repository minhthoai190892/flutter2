// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cubit2cubit/cubit/color/color_cubit.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int increment = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription streamSub;

  CounterCubit(
    this.colorCubit,
  ) : super(CounterState.initial()) {
    streamSub = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        increment = 1;
      } else if (colorState.color == Colors.green) {
        increment = 10;
      } else if (colorState.color == Colors.blue) {
        increment = 100;
      } else if (colorState.color == Colors.black) {
        emit(state.copyWith(counter: state.counter - 100));
        increment = -100;
      }
    });
  }
  void changeCounter() {
    emit(state.copyWith(counter: state.counter + increment));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    streamSub.cancel();
    return super.close();
  }
}
