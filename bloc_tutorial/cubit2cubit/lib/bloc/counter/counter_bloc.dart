// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cubit2cubit/bloc/color/color_bloc.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int increment = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription colorStreamSubscription;
  CounterBloc(
    this.colorBloc,
  ) : super(CounterState.initial()) {
    colorStreamSubscription = colorBloc.stream.listen((colorState) {
      if (colorState.color == Colors.red) {
        increment = 1;
      } else if (colorState.color == Colors.green) {
        increment = 10;
      } else if (colorState.color == Colors.blue) {
        increment = 100;
      } else if (colorState.color == Colors.black) {
        increment = -100;
        add(ChangeCounterEvent());
      }
    });
    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + increment));
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    colorStreamSubscription.cancel();
    return super.close();
  }
}
