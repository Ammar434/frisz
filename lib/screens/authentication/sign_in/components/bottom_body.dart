import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:frisz/widgets/horizontal_line.dart';

import '../../../../utils/constants.dart';

class BottomBody extends StatelessWidget {
  BottomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingValue / 2),
          child: Text(
            "policy_ref",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ).tr(),
        ),
        HorizontalLine(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "change_to_sign_up_1",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ).tr(),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignUpScreen.name);
              },
              child: Text(
                "change_to_sign_up_2",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.white,
                    ),
              ).tr(),
            )
          ],
        ),
        SizedBox(
          height: kSmallPaddingValue,
        ),
      ],
    );
  }
}
