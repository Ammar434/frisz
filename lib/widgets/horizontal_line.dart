import 'package:flutter/material.dart';
import 'package:frisz/utils/constants.dart';

class HorizontalLine extends StatelessWidget {
  HorizontalLine({
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kSmallPaddingValue),
      child: Divider(
        color: color,
        height: 1,
        thickness: 1,
        indent: 10,
        endIndent: 10,
      ),
    );
  }
}
