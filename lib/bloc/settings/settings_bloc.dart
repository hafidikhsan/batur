import 'package:batur/utils/enumerate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState.initial()) {
    on<ThemeChanged>((event, emit) async {
      final newTheme = event.themeType;

      emit(state.copyWith(
        themeType: newTheme,
      ));
    });
  }
}
