import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/authentiction_handler.dart';
import 'package:frisz/screens/authentication/information_gathering/components/user_image_selector.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/utils/constants.dart';
import 'package:frisz/utils/messages.dart';
import 'package:frisz/utils/utils.dart';
import 'package:frisz/widgets/loading_widget.dart';

import '../../../../../services/secure_storage.dart';

class SevenScreen extends StatefulWidget {
  SevenScreen({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<SevenScreen> createState() => _SevenScreenState();
}

class _SevenScreenState extends State<SevenScreen> {
  bool isVisible = true;
  String name = "";
  AuthenticationMethod authenticationMethod = AuthenticationMethod();
  final SecureStorageMethods _secureStorageMethods = SecureStorageMethods();

  void registerUser() async {
    String res = await authenticationMethod.registerUser();
    if (res == SUCCESS_MESSAGE) {
      setState(() {
        isVisible = false;
      });
      Future.delayed(
        Duration(
          seconds: 3,
        ),
      ).then(
        (value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthenticationHandler())),
      );
    } else {
      if (mounted) {
        showSnackBar(context, res);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthenticationHandler(),
          ),
        );
      }
    }
  }

  void loadData() async {
    name = await _secureStorageMethods.getUserPseudoFromSecureStorage();
  }

  @override
  void initState() {
    loadData();
    registerUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: kDurationValue,
        child: isVisible
            ? LoadingWidget()
            : Column(
                key: UniqueKey(),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserImageSelector(
                    isSelectable: false,
                  ),
                  SizedBox(
                    height: kPaddingValue * 3,
                  ),
                  Text(
                    "page_view_7_1",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ).tr(args: [name])
                ],
              ),
      ),
    );
  }
}
