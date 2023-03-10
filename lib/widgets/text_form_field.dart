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
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: kSmallPaddingValue),
      child: TextFormField(
        controller: widget.textEditingController,
        style: Theme.of(context).textTheme.bodyMedium,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(kPaddingValue),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                  // color: Theme.of(context).primaryColor,
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
