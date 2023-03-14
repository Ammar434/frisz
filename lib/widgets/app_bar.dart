import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title, {List<Widget>? trailling}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: Center(
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
      ),
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    actions: trailling ?? [],
    backgroundColor: Colors.transparent,
  );
}
