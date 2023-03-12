import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';

import '../bottom_row.dart';

List<String> options = [
  "page_view_4_bis_2".tr(),
  "page_view_4_bis_3".tr(),
  "page_view_4_bis_4".tr(),
  "page_view_4_bis_5".tr(),
  "page_view_4_bis_6".tr(),
  "page_view_4_bis_7".tr(),
  "page_view_4_bis_8".tr(),
  "page_view_4_bis_9".tr(),
];

class FourthBisScreen extends StatefulWidget {
  const FourthBisScreen({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  State<FourthBisScreen> createState() => _FourthBisScreenState();
}

class _FourthBisScreenState extends State<FourthBisScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: UserImageSelector(
              isSelectable: false,
            ),
          ),
          Text(
            "page_view_4_bis_1",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
          ).tr(),
          const SizedBox(
            height: kPaddingValue,
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(
                    options[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  dense: true,
                  value: options[index],
                  groupValue: tmpSportingProfile,
                  onChanged: (value) {
                    setState(() {
                      tmpSportingProfile = value.toString();
                    });
                  },
                );
              },
            ),
          ),
          BottomRow(
            pageController: widget.pageController,
          ),
        ],
      ),
    );
  }
}
