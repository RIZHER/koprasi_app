import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class InputField extends StatelessWidget {
  final String title;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? icon;
  final Widget? errorIcon;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.title,
    this.onChanged,
    this.obscureText = false,
    this.icon,
    this.errorIcon,
    this.validator,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      style: regular.copyWith(fontSize: 14, color: Black.black_500),
      decoration: primary.copyWith(
        hintText: title,
        hintStyle: regular.copyWith(
          fontSize: 14,
          color: Neutral.neutral_300,
        ),
        suffixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: errorText != null && errorText!.isNotEmpty
                    ? errorIcon
                    : icon,
              )
            : null,
        errorText: errorText,
      ),
    );
  }
}

class InputPin extends StatelessWidget {
  final String title;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? icon;
  final Widget? errorIcon;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextEditingController? controller;

  const InputPin({
    super.key,
    required this.title,
    this.onChanged,
    this.obscureText = true,
    this.icon,
    this.errorIcon,
    this.validator,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 6,
      style: regular.copyWith(fontSize: 14, color: Black.black_500),
      decoration: primary.copyWith(
        hintText: title,
        hintStyle: regular.copyWith(
          fontSize: 14,
          color: Neutral.neutral_300,
        ),
        suffixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: errorText != null && errorText!.isNotEmpty
                    ? errorIcon
                    : icon,
              )
            : null,
        errorText: errorText,
      ),
    );
  }
}
