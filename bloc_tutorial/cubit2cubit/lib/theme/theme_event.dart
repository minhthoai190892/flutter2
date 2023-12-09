// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
   bool isLight;
   ChangeThemeEvent({
    required this.isLight,
  });
  @override
  List<Object> get props => [isLight];
  @override
  String toString() => 'ChangeThemeEvent(isLight: $isLight)';
}
