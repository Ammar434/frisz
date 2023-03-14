import 'package:flutter/material.dart';
import '../utils/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.fontSize = 18,
    this.color,
    this.width = double.infinity,
    this.shouldAnimate = false,
    this.height,
    this.getBorder = false,
    this.textColor = Colors.black,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String text;
  final bool isLoading;
  final double? height;
  final double fontSize;
  final Color? color;
  final double? width;
  final bool shouldAnimate;
  final bool getBorder;
  final Color textColor;
  // final Color secondaryColor;
  @override
  Widget build(BuildContext context) {
    Color? c = color;
    if (color == null) {
      c = const Color(0xffffffff);
    }
    return GestureDetector(
      onTap: !isLoading ? onTap : null,
      child: AnimatedContainer(
        // margin: const EdgeInsets.all(6),
        width: width,
        height: height ?? kDefaultButtonSize,
        decoration: BoxDecoration(
          border: getBorder ? Border.all(color: Colors.black) : null,
          borderRadius: BorderRadius.circular(kRadiusValue),
          color: shouldAnimate ? Colors.green : c,
        ),
        duration: const Duration(milliseconds: 500),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  color: Theme.of(context).primaryColor,
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: textColor,
                      ),
                ),
        ),
      ),
    );
  }
}
