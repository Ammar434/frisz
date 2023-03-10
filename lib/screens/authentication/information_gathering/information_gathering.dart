import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/fifth_screen.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/fourth_screen.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/seven_screen.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/sixth_screen.dart';

import 'components/page_view/first_screen.dart';
import 'components/page_view/second_screen.dart';
import 'components/page_view/third_screen.dart';

class InformationGathering extends StatelessWidget {
  static String name = 'InformationGathering';

  const InformationGathering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            FirstScreen(pageController: pageController),
            SecondScreen(pageController: pageController),
            ThirdScreen(pageController: pageController),
            FourthScreen(pageController: pageController),
            FifthScreen(pageController: pageController),
            SixthScreen(pageController: pageController),
            SevenScreen(pageController: pageController)
          ],
        ),
      ),
    );
  }
}
