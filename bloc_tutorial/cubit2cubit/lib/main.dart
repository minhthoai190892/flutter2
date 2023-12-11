import 'dart:math';

import 'package:cubit2cubit/bloc/color/color_bloc.dart';
import 'package:cubit2cubit/bloc/counter/counter_bloc.dart';
import 'package:cubit2cubit/cubit/color/color_cubit.dart';
import 'package:cubit2cubit/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => ColorCubit()),
        BlocProvider(
          create: (context) => CounterCubit(context.read<ColorCubit>()),
        ),
        BlocProvider(create: (context) => ColorBloc()),
        BlocProvider(
          create: (context) => CounterBloc(context.read<ColorBloc>()),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'cubit2cubit',
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool test = context.read<ThemeBloc>().state.appTheme == AppTheme.light;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                var themeChange =
                    context.read<ThemeBloc>().state.appTheme == AppTheme.light
                        ? false
                        : true;
                if (themeChange) {
                  test = false;
                } else {
                  test = true;
                }
                BlocProvider.of<ThemeBloc>(context)
                    .add(ChangeThemeEvent(isLight: themeChange));
              },
              icon:
                  test ? const Icon(Icons.dark_mode) : const Icon(Icons.sunny))
        ],
      ),
      backgroundColor: context.watch<ColorBloc>().state.color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Change Color',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                context.read<ColorBloc>().add(ChangeColorEvent());
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: const TextStyle(
                fontSize: 52.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text(
                'Increment Counter',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                context.read<CounterBloc>().add(ChangeCounterEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
