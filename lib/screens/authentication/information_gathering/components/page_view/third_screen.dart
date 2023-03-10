import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/utils/constants.dart';

import '../bottom_row.dart';
import '../city_picker.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
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
          const UserImageSelector(
            isSelectable: false,
          ),
          Text(
            "page_view_3_1",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          const CityPicker(),
          BottomRow(
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}
