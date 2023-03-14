import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextButtonPageView extends StatelessWidget {
  TextButtonPageView({
    super.key,
    required this.pageController,
    required this.text,
    required this.onPress,
    required this.isNext,
  });

  final PageController pageController;
  final String text;
  final bool isNext;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: isNext ? Theme.of(context).primaryColor : Colors.grey,
            ),
        // style: Theme.of(context).textTheme.titleMedium,
      ).tr(),
    );
  }
}
