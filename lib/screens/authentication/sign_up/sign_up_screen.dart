import 'package:flutter/material.dart';

import 'components/bottom_body.dart';
import 'components/top_body.dart';

// import '../sign_up/components/bottom_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static String name = 'SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
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
