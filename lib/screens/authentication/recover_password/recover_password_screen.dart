import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/widgets/app_bar.dart';
import 'package:frisz/widgets/rounded_button.dart';
import 'package:frisz/widgets/text_form_field.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({Key? key}) : super(key: key);
  static String name = "RecoverPasswordScreen";
  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final AuthenticationMethod authenticationMethod = AuthenticationMethod();
  late TextEditingController _emailController;

  String? checkEmailField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a email';
    }
    if (authenticationMethod.isEmailValid(value) == false) {
      return 'Please enter a valid email';
    }
    return null;
  }

  bool isLoading = false;
  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, ""),
        body: Padding(
          padding: const EdgeInsets.all(kPaddingValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "recover_password_title",
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
              Text(
                "recover_password_description",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              const SizedBox(
                height: kPaddingValue,
              ),
              CustomTextFormField(
                textEditingController: _emailController,
                hintText: "mail_entry".tr(),
                textInputType: TextInputType.emailAddress,
                validator: checkEmailField,
              ),
              const SizedBox(
                height: kPaddingValue,
              ),
              RoundedButton(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await authenticationMethod.resetPassword(
                    email: _emailController.text,
                  );
                  setState(() {
                    isLoading = false;
                  });
                },
                text: "recover_password_btn".tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
