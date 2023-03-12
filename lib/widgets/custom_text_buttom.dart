import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isUnderline,
    this.isAction = false,
  });
  final Function() onPressed;
  final String text;
  final bool isUnderline;
  final bool isAction;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              decoration: isUnderline ? TextDecoration.underline : null,
              color: isAction ? Theme.of(context).primaryColor : null,
            ),
      ).tr(),
    );
  }
}
