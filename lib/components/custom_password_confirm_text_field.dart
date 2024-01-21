import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPasswordConfirmTextField extends StatelessWidget {
  final String password;
  final bool isSecure;
  final Function() onTap;
  final Function(String?)? onChange;

  const CustomPasswordConfirmTextField({
    super.key,
    required this.password,
    required this.isSecure,
    required this.onTap,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: password,
      autocorrect: false,
      enableSuggestions: false,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Theme.of(context).colorScheme.primary,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: isSecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      decoration: InputDecoration(
        labelText: "${AppLocalizations.of(context)!.passwordRepeat} Password",
        labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SvgPicture.asset(
            MyIcons.lockOutline,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
            height: 24.0,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(17.0),
          child: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              isSecure ? MyIcons.eyeOutline : MyIcons.eyeSlashOutline,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
              height: 24.0,
            ),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        errorMaxLines: 2,
        errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2.0,
          ),
        ),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return AppLocalizations.of(context)!.authMessageEmpty;
        }
        if (!RegExp(
                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])[A-Za-z0-9\\d$@$!%*?&]{6,}")
            .hasMatch(text)) {
          return AppLocalizations.of(context)!.authMessageEnterValidPassword;
        }
        return null;
      },
      onChanged: onChange,
    );
  }
}
