import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeThemeEvent>((event, emit) {
      if (event.isLight) {
        emit(state.copyWith(appTheme: AppTheme.light));
        event.isLight = false;
        print(state.copyWith(appTheme: AppTheme.light));
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark));
        event.isLight = true;

        print(state.copyWith(appTheme: AppTheme.dark));
      }
    });
  }
}
