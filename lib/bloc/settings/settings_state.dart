part of 'settings_bloc.dart';

@immutable
class SettingsState extends Equatable {
  final ThemeEnum themeType;

  const SettingsState({required this.themeType});

  factory SettingsState.initial() {
    return const SettingsState(themeType: ThemeEnum.system);
  }

  SettingsState copyWith({ThemeEnum? themeType}) {
    return SettingsState(themeType: themeType ?? this.themeType);
  }

  @override
  List<Object> get props => [themeType];
}
