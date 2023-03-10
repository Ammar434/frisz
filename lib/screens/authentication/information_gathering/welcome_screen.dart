import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/information_gathering.dart';
import 'package:lottie/lottie.dart';

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
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset(
                "assets/lotties/1370-confetti.json",
                repeat: false,
              ),
              Text(
                "welcome",
                style: Theme.of(context).textTheme.titleLarge,
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
