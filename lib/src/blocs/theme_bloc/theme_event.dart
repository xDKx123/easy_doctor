part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class LoadTheme extends ThemeEvent {
  const LoadTheme();

  @override
  List<Object?> get props => const <Object?>[];
}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged({
    required this.theme,
  });

  final String theme;

  @override
  List<Object?> get props => <Object?>[theme];

  @override
  String toString() {
    return 'ThemeChanged: {"theme" : "$theme"}';
  }
}
