import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../utils/constants.dart';
import '../../splash_screen.dart';
import 'components/bottom_body.dart';
import 'components/top_body.dart';

// import '../sign_up/components/bottom_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static String name = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    double height = MediaQuery.of(context).size.height;

// Height (without SafeArea)
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - padding.bottom;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff52dbc4),
        body: SingleChildScrollView(
          child: Container(
            height: height1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: gradient2.image,
                fit: BoxFit.cover,
              ),
            ),
            child: Animate(
              delay: kDurationValue,
              effects: const [FadeEffect()],
              child: const Column(
                children: [
                  Spacer(),
                  TopBody(),
                  Spacer(),
                  BottomBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
