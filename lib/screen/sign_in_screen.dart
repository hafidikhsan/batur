import 'package:batur/bloc/authentification/authentification_bloc.dart';
import 'package:batur/components/custom_email_text_field.dart';
import 'package:batur/components/custom_row_image_button.dart';
import 'package:batur/components/custom_image_logo.dart';
import 'package:batur/components/custom_password_text_field.dart';
import 'package:batur/components/custom_text_button.dart';
import 'package:batur/screen/sign_up_screen.dart';
import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          CustomEmailTextField(
            email: "",
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
          BlocBuilder<AuthentificationBloc, AuthentificationState>(
            builder: (context, state) {
              return CustomPasswordTextField(
                password: "",
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
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthentificationBloc, AuthentificationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomTextButton(
            text: AppLocalizations.of(context)!.signIn,
            onTap: () {
              print(state.email);
              print(state.password);
            },
          ),
        );
      },
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
          child: CustomRowImageButton(
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
              context.read<AuthentificationBloc>().add(
                    const OnCleanForm(),
                  );
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
