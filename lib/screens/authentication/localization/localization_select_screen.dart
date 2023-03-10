import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/utils/constants.dart';

import '../../../services/shared_preferences.dart';
import '../authentiction_handler.dart';

class LocalizationSelectScreen extends StatefulWidget {
  const LocalizationSelectScreen({Key? key}) : super(key: key);

  @override
  State<LocalizationSelectScreen> createState() => _LocalizationSelectScreenState();
}

class _LocalizationSelectScreenState extends State<LocalizationSelectScreen> {
  bool isLoading = false;
  @override
  void initState() {
    context.setLocale(const Locale('fr'));
    super.initState();
  }

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
              Center(
                child: Text(
                  "msg_welcome_localization",
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale('en'));
                      });
                    },
                    child: Text(
                      "en",
                      style: TextStyle(
                        decoration: !isLocaleFrench ? TextDecoration.underline : null,
                      ),
                    ).tr(),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale('fr'));
                      });
                      debugPrint(context.locale.toString());
                    },
                    child: Text(
                      "fr",
                      style: TextStyle(
                        decoration: isLocaleFrench ? TextDecoration.underline : null,
                      ),
                    ).tr(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: isLoading
                    ? const LinearProgressIndicator()
                    : TextButton(
                        onPressed: () async {
                          await MySharedPreferences.instance.setBooleanValue(
                            SharedPrefKey.isfirstRun.toString(),
                            true,
                          );
                          if (mounted) {
                            Navigator.pushNamed(
                              context,
                              AuthenticationHandler.name,
                            );
                          }
                        },
                        child: const Text(
                          "button_next",
                        ).tr(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
