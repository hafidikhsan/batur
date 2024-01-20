import 'package:batur/components/custom_email_text_field.dart';
import 'package:batur/components/custom_fullname_text_field.dart';
import 'package:batur/components/custom_image_button.dart';
import 'package:batur/components/custom_image_logo.dart';
import 'package:batur/components/custom_password_confirm_text_field.dart';
import 'package:batur/components/custom_password_text_field.dart';
import 'package:batur/components/custom_text_button.dart';
import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tuple/tuple.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              _SignUpForm(),
              _SignUpButton(),
              _OtherSignUp(),
              _ToSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.signUp,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const CustomFullNameTextField(
            fullName: "",
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
          const SizedBox(
            height: 15.0,
          ),
          const CustomPasswordConfirmTextField(
            password: '',
            isSecure: false,
          ),
        ],
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: CustomTextButton(
        text: AppLocalizations.of(context)!.signUp,
        onTap: () {},
      ),
    );
  }
}

class _OtherSignUp extends StatelessWidget {
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
                () {},
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

class _ToSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.signUpToSignIn,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.signIn,
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
