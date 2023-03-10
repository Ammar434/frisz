import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/authentiction_handler.dart';
import 'package:frisz/screens/authentication/localization/localization_select_screen.dart';
import 'package:frisz/services/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late bool isFirstLaunch;

  Future<Widget> futureCall() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isFirstLaunch = await MySharedPreferences.instance.getBooleanValue(
      SharedPrefKey.isfirstRun.toString(),
    );

    if (!isFirstLaunch) {
      return Future.value(const LocalizationSelectScreen());
    }
    return Future.value(
      const AuthenticationHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network('https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
      title: const Text(
        "FRISZ",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      // gradientBackground: const RadialGradient(colors: [Color(0xFF3eb1cd), Color(0xFF62fda9)]),
      // backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: const Text("Loading..."),
      futureNavigator: futureCall(),
    );
  }
}
