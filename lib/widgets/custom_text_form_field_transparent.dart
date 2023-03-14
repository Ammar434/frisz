import 'package:flutter/material.dart';
import 'package:frisz/utils/colors.dart';
import 'package:frisz/utils/constants.dart';

class CustomTextFormFieldTransparent extends StatefulWidget {
  const CustomTextFormFieldTransparent({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.isPassword = false,
    required this.validator,
  });
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormFieldTransparent> createState() => _CustomTextFormFieldTransparentState();
}

class _CustomTextFormFieldTransparentState extends State<CustomTextFormFieldTransparent> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    var inputBorder = OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(kRadiusValue)),
        borderSide: BorderSide(
          color: kButtonColor,
          width: 1,
        ));
    return Padding(
      padding: EdgeInsets.only(bottom: kSmallPaddingValue),
      child: TextFormField(
        controller: widget.textEditingController,
        style: Theme.of(context).textTheme.bodyMedium,
        validator: widget.validator,
        decoration: InputDecoration(
          // hintText: widget.hintText,

          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          // fillColor: Colors.black.withOpacity(0.3),
          filled: false,
          contentPadding: EdgeInsets.all(kPaddingValue),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                  color: Colors.white,
                  onPressed: () {
                    setState(
                      () {
                        isObscure = !isObscure;
                      },
                    );
                  },
                )
              : null,
        ),
        keyboardType: widget.textInputType,
        obscureText: isObscure && widget.isPassword,
      ),
    );
  }
}
