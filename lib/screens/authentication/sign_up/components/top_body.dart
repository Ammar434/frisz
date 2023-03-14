import 'package:flutter/material.dart';
import 'package:frisz/utils/constants.dart';

import 'form_widget.dart';

class TopBody extends StatelessWidget {
  TopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kPaddingValue,
        right: kPaddingValue,
        top: kPaddingValue,
      ),
      child: Column(
        // shrinkWrap: true,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              kAppName,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(
            height: kPaddingValue * 2,
          ),
          FormWidget(),
          SizedBox(
            height: kSmallPaddingValue,
          ),
        ],
      ),
    );
  }
}
