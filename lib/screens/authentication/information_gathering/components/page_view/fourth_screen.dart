import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/bottom_row.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/widgets/rounded_button.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
            "page_view_4_1",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          Column(
            children: [
              RoundedButton(
                onTap: () {
                  setState(() {
                    temporaryIsProfesionalAthelete = true;
                  });
                },
                text: "page_view_4_2".tr(),
                color: temporaryIsProfesionalAthelete == false ? Colors.grey : null,
              ),
              RoundedButton(
                onTap: () {
                  setState(() {
                    temporaryIsProfesionalAthelete = false;
                  });
                },
                text: "page_view_4_3".tr(),
                color: !temporaryIsProfesionalAthelete == false ? Colors.grey : null,
              ),
            ],
          ),
          BottomRow(
            pageController: widget.pageController,
          ),
        ],
      ),
    );
  }
}
