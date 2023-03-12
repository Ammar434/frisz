import 'package:flutter/material.dart';
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
        ],
      ),
    );
  }
}
