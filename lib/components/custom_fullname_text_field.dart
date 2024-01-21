import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomFullNameTextField extends StatelessWidget {
  final String fullName;
  final Function(String?)? onChange;

  const CustomFullNameTextField({
    super.key,
    required this.fullName,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: fullName,
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
        labelText: AppLocalizations.of(context)!.fullName,
        labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        hintText: "Hafid Ikhsan Arifin",
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SvgPicture.asset(
            MyIcons.userOutline,
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
      onChanged: onChange,
    );
  }
}
