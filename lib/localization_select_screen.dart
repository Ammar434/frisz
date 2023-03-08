import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/constants.dart';

class LocalizationSelectScreen extends StatefulWidget {
  const LocalizationSelectScreen({Key? key}) : super(key: key);

  @override
  State<LocalizationSelectScreen> createState() =>
      _LocalizationSelectScreenState();
}

class _LocalizationSelectScreenState extends State<LocalizationSelectScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLocaleFrench = context.locale.toString().contains('fr');

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(kPaddingValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: Text("msg").tr()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(Locale('fr'));
                      });
                      debugPrint(context.locale.toString());
                    },
                    child: Text(
                      "Français",
                      style: TextStyle(
                          color: Colors.black,
                          decoration:
                              isLocaleFrench ? TextDecoration.underline : null),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(Locale('en'));
                      });
                    },
                    child: Text(
                      "Anglais",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: !isLocaleFrench
                              ? TextDecoration.underline
                              : null),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Suivant",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
