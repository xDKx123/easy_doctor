part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LoadLanguage extends LanguageEvent {
  const LoadLanguage();

  @override
  List<Object?> get props => [];
}

class ChangeLanguage extends LanguageEvent {
  const ChangeLanguage({required this.language});

  final Language language;

  @override
  List<Object?> get props => [language];
}
