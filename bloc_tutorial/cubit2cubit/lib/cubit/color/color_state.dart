// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;
  const ColorState({
    required this.color,
  });

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  factory ColorState.initial() {
    return const ColorState(color: Colors.red);
  }
  @override
  String toString() => 'ColorState(color: $color)';

  @override

  List<Object> get props => [color];
}
