import 'package:flutter/material.dart';

import 'components/bottom_body.dart';
import 'components/top_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String name = "SignInScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              children: [
                const Spacer(),
                TopBody(),
                const Spacer(),
                const BottomBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
