part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends SettingsEvent {
  final ThemeEnum themeType;

  const ThemeChanged(this.themeType);

  @override
  List<Object> get props => [themeType];
}
