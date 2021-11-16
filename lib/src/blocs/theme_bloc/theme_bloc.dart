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
    on<ThemeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  void onEvent(ThemeEvent event) {
    // TODO: implement onEvent
    super.onEvent(event); //must call super;

    if (event is ThemeChanged) {
    } else if (event is LoadTheme) {}
  }
}
