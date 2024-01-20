part of 'settings_bloc.dart';

@immutable
class SettingsState extends Equatable {
  final ThemeEnum themeType;
  final LanguagesEnum languages;

  const SettingsState({
    required this.themeType,
    required this.languages,
  });

  factory SettingsState.initial() {
    return const SettingsState(
      themeType: ThemeEnum.system,
      languages: LanguagesEnum.english,
    );
  }

  SettingsState copyWith({
    ThemeEnum? themeType,
    LanguagesEnum? languages,
  }) {
    return SettingsState(
      themeType: themeType ?? this.themeType,
      languages: languages ?? this.languages,
    );
  }

  @override
  List<Object> get props => [themeType, languages];
}
