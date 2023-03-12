import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/fifth_screen.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/fourth_screen.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/seven_screen.dart';
import 'package:frisz/screens/authentication/information_gathering/components/page_view/sixth_screen.dart';
import 'package:frisz/services/authentication_method.dart';

import 'components/page_view/first_screen.dart';
import 'components/page_view/fourth_bis_screen.dart';
import 'components/page_view/second_screen.dart';
import 'components/page_view/third_screen.dart';

class InformationGathering extends StatelessWidget {
  static String name = 'InformationGathering';

  const InformationGathering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    List page = [
      FirstScreen(pageController: pageController),
      SecondScreen(pageController: pageController),
      ThirdScreen(pageController: pageController),
      FourthScreen(pageController: pageController),
      FourthBisScreen(pageController: pageController),
      FifthScreen(pageController: pageController),
      SixthScreen(pageController: pageController),
      SevenScreen(pageController: pageController)
    ];
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            if (index == 4 && temporaryIsProfesionalAthelete) {
              return page[4];
            } else if (index == 4 && !temporaryIsProfesionalAthelete) {
              return page[5];
            }
            return page[index];
          },
        ),
      ),
    );
  }
}
