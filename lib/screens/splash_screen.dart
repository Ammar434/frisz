import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/authentiction_handler.dart';
import 'package:frisz/screens/authentication/localization/localization_select_screen.dart';
import 'package:frisz/services/shared_preferences.dart';

late Image gradient1;
late Image gradient2;
late Image gradient3;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late bool isFirstLaunch;

  Future<Widget> futureCall() async {
    await Future.delayed(Duration(seconds: 2));

    bool isFirstLaunch = await MySharedPreferences.instance.getBooleanValue(
      SharedPrefKey.isfirstRun.toString(),
    );

    if (!isFirstLaunch) {
      return Future.value(LocalizationSelectScreen());
    }

    return Future.value(
      AuthenticationHandler(),
    );
  }

  @override
  void initState() {
    gradient1 = Image.asset("assets/gradients/log_in.png");
    gradient2 = Image.asset("assets/gradients/sign_in.png");
    gradient3 = Image.asset("assets/gradients/welcome.png");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(gradient1.image, context);
    precacheImage(gradient2.image, context);
    precacheImage(gradient3.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network('https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
      title: Text(
        "FRISZ",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      // gradientBackground:  RadialGradient(colors: [Color(0xFF3eb1cd), Color(0xFF62fda9)]),
      // backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: Text("Loading..."),
      futureNavigator: futureCall(),
    );
  }
}
