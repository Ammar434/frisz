import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:frisz/authentiction_handler.dart';
import 'package:frisz/localization_select_screen.dart';
import 'package:frisz/shared_preferences.dart';

class SplashFuturePage extends StatefulWidget {
  SplashFuturePage({Key? key}) : super(key: key);

  @override
  _SplashFuturePageState createState() => _SplashFuturePageState();
}

class _SplashFuturePageState extends State<SplashFuturePage> {
  late bool isFirstLaunch;

  Future<Widget> futureCall() async {
    bool isFirstLaunch =
        await MySharedPreferences.instance.getBooleanValue("isfirstRun");
    if (!isFirstLaunch) return Future.value(LocalizationSelectScreen());
    return Future.value(AuthenticationHandler());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
      title: Text(
        "FRISZ",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: Text("Loading..."),
      futureNavigator: futureCall(),
    );
  }
}
