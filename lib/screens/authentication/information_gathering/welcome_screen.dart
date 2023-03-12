import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:frisz/screens/authentication/information_gathering/information_gathering.dart';
import 'package:frisz/utils/constants.dart';

import '../../splash_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String name = 'WelcomeScreen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then(
      (value) => Navigator.pushNamed(
        context,
        InformationGathering.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff52dbc4),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: gradient3.image,
              fit: BoxFit.cover,
            ),
          ),
          child: Animate(
            delay: kDurationValue,
            effects: const [ScaleEffect(), FadeEffect()],
            child: Center(
              child: Text(
                "welcome",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                    ),
              ).tr(),
            ),
          ),
        ),
      ),
    );
  }
}
