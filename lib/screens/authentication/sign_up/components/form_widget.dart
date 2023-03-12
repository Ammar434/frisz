import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/information_gathering/welcome_screen.dart';
import 'package:frisz/services/secure_storage.dart';
import 'package:frisz/widgets/rounded_button.dart';
import 'package:frisz/widgets/text_form_field.dart';

import '../../../../services/authentication_method.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthenticationMethod authenticationMethod = AuthenticationMethod();
  final SecureStorageMethods _secureStorageMethods = SecureStorageMethods();

  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _pseudoController;
  late TextEditingController _passwordController;
  bool isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _pseudoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _pseudoController.dispose();
    super.dispose();
  }

  String? checkEmailField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a email';
    }
    if (authenticationMethod.isEmailValid(value) == false) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? checkNameField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }

    return null;
  }

  String? checkPseudoField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a pseudo';
    }

    if (value.length < 5) {
      return 'Please enter a pseudo of more than 5 letters';
    }

    return null;
  }

  String? checkPasswordField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.length < 5) {
      return 'Choose a password of more than 8 letters';
    }

    return null;
  }

  void formValidate() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _secureStorageMethods.writeSecureUserData(
        email: _emailController.text,
        password: _passwordController.text,
        userName: _nameController.text,
        userPseudo: _pseudoController.text,
      );

      setState(() {
        isLoading = false;
      });
      if (mounted) {
        Navigator.pushNamed(
          context,
          WelcomeScreen.name,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        //  mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            textEditingController: _emailController,
            hintText: "mail_entry".tr(),
            textInputType: TextInputType.emailAddress,
            validator: checkEmailField,
          ),
          CustomTextFormField(
            textEditingController: _nameController,
            hintText: "signup_name".tr(),
            textInputType: TextInputType.visiblePassword,
            validator: checkNameField,
          ),
          CustomTextFormField(
            textEditingController: _pseudoController,
            hintText: "signup_pseudo".tr(),
            textInputType: TextInputType.visiblePassword,
            validator: checkPseudoField,
          ),
          CustomTextFormField(
            textEditingController: _passwordController,
            hintText: "password_entry".tr(),
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
            validator: checkPasswordField,
          ),
          // CustomTextFormField(
          //   textEditingController: TextEditingController(),
          //   hintText: "password_entry_confirm".tr(),
          //   isPassword: true,
          //   textInputType: TextInputType.visiblePassword,
          //   validator: checkPasswordField,
          // ),
          RoundedButton(
            onTap: formValidate,
            text: "register_button".tr(),
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}
