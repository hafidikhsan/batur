import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomEmailTextField extends StatelessWidget {
  final String email;

  const CustomEmailTextField({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: email,
      autocorrect: false,
      enableSuggestions: false,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Theme.of(context).colorScheme.primary,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        hintText: "hafidikhsanarifin@gmail.com",
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SvgPicture.asset(
            MyIcons.mailOutline,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
            height: 24.0,
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
        errorMaxLines: 1,
        errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.error,
              overflow: TextOverflow.ellipsis,
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
        return null;
      },
    );
  }
}
