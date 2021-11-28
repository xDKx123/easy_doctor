part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LoadedLanguage extends LanguageState {
  const LoadedLanguage({required this.locale});

  final Locale locale;

  @override
  List<Object?> get props => [locale];
}
