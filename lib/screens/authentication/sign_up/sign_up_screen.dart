import 'package:flutter/material.dart';

import 'components/bottom_body.dart';
import 'components/top_body.dart';

// import '../sign_up/components/bottom_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static String name = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

// Height (without SafeArea)
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - padding.bottom;

// Height (without status bar)
    double height2 = height - padding.top;

// Height (without status and toolbar)
    double height3 = height - padding.top - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: height1,
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
    );
  }
}
