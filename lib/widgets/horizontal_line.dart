import 'package:flutter/material.dart';
import 'package:frisz/utils/constants.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSmallPaddingValue),
      child: Divider(
        color: Theme.of(context).dividerColor,
        height: 1,
        thickness: 1,
        indent: 10,
        endIndent: 10,
      ),
    );
  }
}
