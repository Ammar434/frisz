import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/text_button_page_view.dart';
import 'package:frisz/utils/constants.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
    required this.pageController,
    this.onTap,
  });

  final PageController pageController;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Function() newFunc = onTap ??
        () {
          pageController.nextPage(
            duration: kDurationValue,
            curve: Curves.easeInOut,
          );
        };
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButtonPageView(
            pageController: pageController,
            text: "page_view_skip",
            isNext: false,
            onPress: () {
              pageController.animateToPage(
                7,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
              );
            },
          ),
          TextButtonPageView(
            isNext: true,
            pageController: pageController,
            text: "page_view_suivant",
            onPress: newFunc,
          ),
        ],
      ),
    );
  }
}
