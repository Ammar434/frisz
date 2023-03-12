import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:frisz/widgets/horizontal_line.dart';

import '../../../../utils/constants.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingValue / 2),
          child: Text(
            "policy_ref",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
          ).tr(),
        ),
        const HorizontalLine(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "change_to_sign_in_1",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ).tr(),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignInScreen.name);
              },
              child: Text(
                "change_to_sign_in_2",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.white,
                    ),
              ).tr(),
            )
          ],
        ),
        const SizedBox(
          height: kSmallPaddingValue,
        ),
      ],
    );
  }
}
