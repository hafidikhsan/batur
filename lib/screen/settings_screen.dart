import 'package:batur/bloc/settings/settings_bloc.dart';
import 'package:batur/utils/enumerate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return Text(
                  "Current ${AppLocalizations.of(context)!.theme}: ${state.themeType.name}",
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return DropdownButton<ThemeEnum>(
                  value: state.themeType,
                  onChanged: (ThemeEnum? themeType) {
                    if (themeType != null) {
                      context.read<SettingsBloc>().add(ThemeChanged(themeType));
                    }
                  },
                  items: ThemeEnum.values.map((ThemeEnum themeType) {
                    return DropdownMenuItem<ThemeEnum>(
                      value: themeType,
                      child: Text(themeType.name),
                    );
                  }).toList(),
                );
              },
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return Text(
                  "Current ${AppLocalizations.of(context)!.languages}: ${state.languages.name}",
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return DropdownButton<LanguagesEnum>(
                  value: state.languages,
                  onChanged: (LanguagesEnum? languagesType) {
                    if (languagesType != null) {
                      context
                          .read<SettingsBloc>()
                          .add(LanguagesChanged(languagesType));
                    }
                  },
                  items:
                      LanguagesEnum.values.map((LanguagesEnum languagesType) {
                    return DropdownMenuItem<LanguagesEnum>(
                      value: languagesType,
                      child: Text(languagesType.name),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
