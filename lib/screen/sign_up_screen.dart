import 'package:batur/bloc/authentification/authentification_bloc.dart';
import 'package:batur/components/custom_email_text_field.dart';
import 'package:batur/components/custom_fullname_text_field.dart';
import 'package:batur/components/custom_row_image_button.dart';
import 'package:batur/components/custom_image_logo.dart';
import 'package:batur/components/custom_password_confirm_text_field.dart';
import 'package:batur/components/custom_password_text_field.dart';
import 'package:batur/components/custom_text_button.dart';
import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tuple/tuple.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            _SignUpForm(),
            _SignUpButton(),
            _OtherSignUp(),
            _ToSignIn(),
          ],
        ),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthentificationBloc, AuthentificationState>(
      builder: (context, state) {
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
              CustomFullNameTextField(
                fullName: state.fullName,
                onChange: (String? text) {
                  context.read<AuthentificationBloc>().add(
                        OnFullNameFormChanged(
                          fullName: text!,
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomEmailTextField(
                email: state.email,
                onChange: (String? text) {
                  context.read<AuthentificationBloc>().add(
                        OnEmailFormChanged(
                          email: text!,
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomPasswordTextField(
                password: state.password,
                isSecure: state.passwordDisplay,
                onTap: () {
                  context.read<AuthentificationBloc>().add(
                        const OnPasswordDisplayChanged(),
                      );
                },
                onChange: (String? text) {
                  context.read<AuthentificationBloc>().add(
                        OnPasswordFormChanged(
                          password: text!,
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomPasswordConfirmTextField(
                password: state.passwordRepeat,
                isSecure: state.passwordRepeatDisplay,
                onTap: () {
                  context.read<AuthentificationBloc>().add(
                        const OnPasswordRepeatDisplayChanged(),
                      );
                },
                onChange: (String? text) {
                  context.read<AuthentificationBloc>().add(
                        OnPasswordRepeatFormChanged(
                          passwordRepeat: text!,
                        ),
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthentificationBloc, AuthentificationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomTextButton(
            text: AppLocalizations.of(context)!.signUp,
            onTap: () {
              print(state.email);
              print(state.password);
              print(state.passwordDisplay);
              print(state.passwordRepeat);
              context.read<AuthentificationBloc>().add(
                    const OnEmailSignUp(),
                  );
              print(state.user);
            },
          ),
        );
      },
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
          child: CustomRowImageButton(
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
              context.read<AuthentificationBloc>().add(
                    const OnCleanForm(),
                  );
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
