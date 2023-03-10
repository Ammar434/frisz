import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frisz/provider/user_provider.dart';
import 'package:frisz/screens/application/home_screen.dart';
import 'package:frisz/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../widgets/loading_widget.dart';

class AuthenticationHandler extends StatelessWidget {
  static String name = "AuthenticationHandler";
  const AuthenticationHandler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            UserProvider? userProvider = Provider.of(context);
            if (userProvider == null) {
              return const LoadingWidget();
            }
            Provider.of<UserProvider>(context).refreshUser();
            return const HomeScreen();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Some internal error happen please contact the developper",
              ),
            );
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LoadingWidget(),
          );
        }
        return const SignInScreen();
      },
    );
  }
}
