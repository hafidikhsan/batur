import 'package:batur/screen/settings_screen.dart';
import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "Batur",
                style: MyTextStyles.headings1,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: MyColors.primaryDark,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
                child: const Text("Settings"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
