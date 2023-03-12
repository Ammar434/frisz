import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:frisz/utils/constants.dart';

import '../../splash_screen.dart';
import 'components/bottom_body.dart';
import 'components/top_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String name = "SignInScreen";

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
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Container(
              height: height1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: gradient1.image,
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
      ),
    );
  }
}
