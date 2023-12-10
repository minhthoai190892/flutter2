import 'package:bloc_anonymous/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (BuildContext context, state) {
            return Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 52.0),
            );
          },
        ),
      ),
    );
  }
}
