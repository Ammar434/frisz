import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/utils/constants.dart';

import '../bottom_row.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "page_view_1_1",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
          ).tr(),
          Text(
            "page_view_1_2",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ).tr(),
          BottomRow(
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}
