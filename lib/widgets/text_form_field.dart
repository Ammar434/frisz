import 'package:flutter/material.dart';
import 'package:frisz/utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(kRadiusValue)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 3,
        ));
    return Padding(
      padding: const EdgeInsets.only(bottom: kSmallPaddingValue),
      child: TextFormField(
        controller: widget.textEditingController,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          fillColor: Colors.black.withOpacity(0.3),
          filled: true,
          contentPadding: const EdgeInsets.all(kPaddingValue),
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
