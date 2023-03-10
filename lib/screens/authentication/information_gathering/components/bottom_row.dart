import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/text_button_page_view.dart';
import 'package:frisz/utils/constants.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButtonPageView(
            pageController: pageController,
            text: "page_view_skip",
            color: Colors.grey,
            onPress: () {
              pageController.animateToPage(
                7,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
              );
            },
          ),
          TextButtonPageView(
            pageController: pageController,
            text: "page_view_suivant",
            onPress: () {
              pageController.nextPage(
                duration: kDurationValue,
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
