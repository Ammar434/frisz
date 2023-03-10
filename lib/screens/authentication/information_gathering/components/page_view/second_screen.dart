import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/utils/constants.dart';

import '../bottom_row.dart';
import '../user_image_selector.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "page_view_2_1",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          Column(
            children: [
              const UserImageSelector(),
              const SizedBox(
                height: kPaddingValue,
              ),
              Text(
                "page_view_2_2",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ).tr(),
            ],
          ),
          BottomRow(
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}
