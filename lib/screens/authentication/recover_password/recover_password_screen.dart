import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frisz/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/colors.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/utils/messages.dart';
import 'package:frisz/utils/utils.dart';
import 'package:frisz/widgets/custom_text_form_field_transparent.dart';
import 'package:frisz/widgets/horizontal_line.dart';
import 'package:frisz/widgets/rounded_button.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({Key? key}) : super(key: key);
  static String name = "RecoverPasswordScreen";
  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final AuthenticationMethod authenticationMethod = AuthenticationMethod();
  late TextEditingController _emailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String res = "";
  String? checkEmailField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a email';
    }
    if (authenticationMethod.isEmailValid(value) == false) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void formValidate(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      res = await authenticationMethod.resetPassword(
        email: _emailController.text,
      );

      if (res == SUCCESS_MESSAGE) {
        if (mounted) {
          showSnackBar(
            context,
            "password_reset_confirm".tr(),
          );
        }
      }
      setState(() {
        isLoading = false;
      });
    }
  }

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
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Animate(
            delay: kDurationValue,
            effects: const [FadeEffect()],
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.s,
                children: [
                  const RecoverPasswordAppBar(),
                  Padding(
                    padding: EdgeInsets.all(kPaddingValue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.sp,
                        ),
                        Text(
                          "recover_password_title",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                // color: Colors.white,
                              ),
                        ).tr(),
                        // Text(
                        //   "recover_password_description",
                        //   textAlign: TextAlign.center,
                        //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        //         color: Colors.white,
                        //       ),
                        // ).tr(),
                        SizedBox(
                          height: kPaddingValue,
                        ),

                        CustomTextFormFieldTransparent(
                          textEditingController: _emailController,
                          hintText: "mail_entry".tr(),
                          textInputType: TextInputType.emailAddress,
                          validator: checkEmailField,
                        ),
                        SizedBox(
                          height: kSmallPaddingValue,
                        ),

                        RoundedButton(
                          onTap: () => formValidate(context),
                          text: "recover_password_btn".tr(),
                          color: kButtonColor,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: kPaddingValue,
                        ),
                        Visibility(
                          visible: true,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, SignInScreen.name);
                              },
                              child: Text(
                                "password_reset_return".tr(),
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecoverPasswordAppBar extends StatelessWidget {
  const RecoverPasswordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.sp,
        ),
        Text(
          kAppName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        HorizontalLine(
          color: Colors.grey,
        ),
      ],
    );
  }
}
