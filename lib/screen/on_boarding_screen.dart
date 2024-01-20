import 'package:batur/components/custom_text_button.dart';
import 'package:batur/screen/settings_screen.dart';
import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: _MainSection(),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomTextButton(
                text: AppLocalizations.of(context)!.onboardingButton,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Image.asset(
            Theme.of(context).brightness == Brightness.light
                ? MyImages.appLogoLight
                : MyImages.appLogoDark,
            height: 40,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          MyImages.onBoarding,
          width: 300,
          height: 300,
        ),
        Text(
          AppLocalizations.of(context)!.onboardingTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          AppLocalizations.of(context)!.onboardingDesc,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
