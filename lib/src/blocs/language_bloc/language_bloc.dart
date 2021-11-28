import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/app/localisation/language.dart';
import 'package:easy_doctor/src/utils/localStorage/local_storage.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LocalStorageRepository localStorageRepository;

  LanguageBloc({required this.localStorageRepository})
      : super(LoadedLanguage(locale: Locale('en', 'US'))) {
    on<LanguageEvent>((event, emit) async {
      if (event is LoadLanguage) {
        await _onLoadLanguage(event, emit);
      } else if (event is ChangeLanguage) {
        await _onChangeLanguage(event, emit);
      }
    });
  }

  Future<void> _onLoadLanguage(
      LoadLanguage event, Emitter<LanguageState> emit) async {
    String? languageCode = await localStorageRepository.getLanguageCode();

    Locale locale;
    if (languageCode != null) {
      locale = Locale(languageCode, languageCode.toUpperCase());
    } else {
      locale = const Locale('en', 'US');
      await localStorageRepository.setLanguageCode(locale.languageCode);
    }

    emit(LoadedLanguage(locale: locale));
  }

  Future<void> _onChangeLanguage(
      ChangeLanguage event, Emitter<LanguageState> emit) async {
    final Locale locale =
        Locale(event.language.isoCode, event.language.isoCode.toUpperCase());
    await localStorageRepository.setLanguageCode(locale.languageCode);

    emit(LoadedLanguage(locale: locale));
  }
}
