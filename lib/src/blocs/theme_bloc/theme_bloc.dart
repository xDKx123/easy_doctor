import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/utils/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData: appThemeData[AppThemes.dark] ?? ThemeData.dark())) {
    on<ThemeEvent>((ThemeEvent event, Emitter<ThemeState> emit) async {
      if (event is LoadTheme) {
        await _onLoadTheme(event, emit);
      }
    });
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    emit(ThemeState(themeData: appThemeData[AppThemes.dark]!));
  }
}
