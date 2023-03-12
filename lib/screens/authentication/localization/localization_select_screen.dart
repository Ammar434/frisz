import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/authentiction_handler.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/widgets/custom_text_buttom.dart';

import '../../../services/shared_preferences.dart';

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
          padding: const EdgeInsets.all(kPaddingValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  "msg_welcome_localization",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                ).tr(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale('en'));
                      });
                    },
                    text: 'en',
                    isUnderline: !isLocaleFrench,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale('fr'));
                      });
                    },
                    text: 'fr',
                    isUnderline: isLocaleFrench,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: isLoading
                    ? const LinearProgressIndicator()
                    : CustomTextButton(
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
                        text: "button_next",
                        isUnderline: false,
                        isAction: true,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
