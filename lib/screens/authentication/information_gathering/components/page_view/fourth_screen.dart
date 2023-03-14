import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/bottom_row.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/widgets/rounded_button.dart';

class FourthScreen extends StatefulWidget {
  FourthScreen({
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
      padding: EdgeInsets.all(kPaddingValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserImageSelector(
            isSelectable: false,
          ),
          Text(
            "page_view_4_1",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
          ).tr(),
          Column(
            children: [
              RoundedButton(
                onTap: () {
                  setState(() {
                    temporaryIsProfesionalAthelete = true;
                  });
                },
                getBorder: true,
                text: "page_view_4_2".tr(),
                color: temporaryIsProfesionalAthelete == false ? Theme.of(context).cardColor : Colors.black,
                textColor: !temporaryIsProfesionalAthelete == false ? Theme.of(context).cardColor : Colors.black,
              ),
              RoundedButton(
                onTap: () {
                  setState(() {
                    temporaryIsProfesionalAthelete = false;
                  });
                },
                getBorder: true,
                text: "page_view_4_3".tr(),
                color: !temporaryIsProfesionalAthelete == false ? Theme.of(context).cardColor : Colors.black,
                textColor: temporaryIsProfesionalAthelete == false ? Theme.of(context).cardColor : Colors.black,
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
