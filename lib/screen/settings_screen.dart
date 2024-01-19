import 'package:batur/bloc/settings/settings_bloc.dart';
import 'package:batur/utils/enumerate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Column (
          children: [
            const Text("Theme"),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return Text(
                  "Current Theme: ${state.themeType.name}",
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
          ],
        ),
      ),
    );
  }
}
