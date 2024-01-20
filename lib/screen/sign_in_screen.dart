import 'package:batur/components/custom_email_text_field.dart';
import 'package:batur/components/custom_image_button.dart';
import 'package:batur/components/custom_image_logo.dart';
import 'package:batur/components/custom_password_text_field.dart';
import 'package:batur/components/custom_text_button.dart';
import 'package:batur/screen/sign_up_screen.dart';
import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tuple/tuple.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: CustomImageLogo(
                height: 60.0,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            _SignInForm(),
            _SignInButton(),
            _OtherSignIn(),
            _ToSignUp(),
          ],
        ),
      ),
    );
  }
}

class _SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.signIn,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const CustomEmailTextField(
            email: "",
          ),
          const SizedBox(
            height: 15.0,
          ),
          const CustomPasswordTextField(
            password: "",
            isSecure: true,
          ),
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: CustomTextButton(
        text: AppLocalizations.of(context)!.signIn,
        onTap: () {},
      ),
    );
  }
}

class _OtherSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.signInOr,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomImageButton(
            buttons: [
              Tuple2(
                MyIcons.google,
                () => Navigator.pop(context),
              ),
              Tuple2(
                MyIcons.facebook,
                () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ToSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.signInToSignUp,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
            child: Text(
              AppLocalizations.of(context)!.signUp,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
