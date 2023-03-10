import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/messages.dart';
import 'package:frisz/utils/utils.dart';
import 'package:frisz/widgets/rounded_button.dart';
import 'package:frisz/widgets/text_form_field.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthenticationMethod authenticationMethod = AuthenticationMethod();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isLoading = false;
  String? checkEmailField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a email';
    }
    if (authenticationMethod.isEmailValid(value) == false) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? checkPasswordField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  void formValidate(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      String res = await authenticationMethod.loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (res != SUCCESS_MESSAGE) {
        if (mounted) showSnackBar(context, res);
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            textEditingController: _emailController,
            hintText: "mail_entry".tr(),
            textInputType: TextInputType.emailAddress,
            validator: checkEmailField,
          ),
          CustomTextFormField(
            textEditingController: _passwordController,
            hintText: "password_entry".tr(),
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
            validator: checkPasswordField,
          ),
          RoundedButton(
            onTap: () => formValidate(context),
            text: "connect_button".tr(),
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}
