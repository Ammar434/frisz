import 'package:flutter/material.dart';


class AuthenticationHandler extends StatefulWidget {
  const AuthenticationHandler({Key? key}) : super(key: key);

  @override
  State<AuthenticationHandler> createState() => _AuthenticationHandlerState();
}

class _AuthenticationHandlerState extends State<AuthenticationHandler> {
  bool isLoading = false;

  void loadData()async{
  setState(() {
    isLoading = true;
  });


  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

