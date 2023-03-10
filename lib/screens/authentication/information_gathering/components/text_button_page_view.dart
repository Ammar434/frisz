import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextButtonPageView extends StatelessWidget {
  const TextButtonPageView({
    super.key,
    required this.pageController,
    required this.text,
    this.color,
    required this.onPress,
  });

  final PageController pageController;
  final String text;
  final Color? color;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: color != null ? const TextStyle(color: Colors.grey) : null,
        // style: Theme.of(context).textTheme.titleMedium,
      ).tr(),
    );
  }
}
