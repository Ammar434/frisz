import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/recover_password/recover_password_screen.dart';
import 'package:frisz/utils/constants.dart';

import 'form_widget.dart';

class TopBody extends StatelessWidget {
  const TopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingValue),
      child: Column(
        children: [
          Center(
            child: Text(
              kAppName,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(
            height: kPaddingValue * 2,
          ),
          const FormWidget(),
          const SizedBox(
            height: kSmallPaddingValue,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RecoverPasswordScreen.name);
              },
              child: Text(
                "forget_password",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ).tr(),
            ),
          )
        ],
      ),
    );
  }
}
