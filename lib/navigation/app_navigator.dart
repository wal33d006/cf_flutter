import 'package:flutter/material.dart';

class AppNavigator {
  push(BuildContext context, Widget page) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  close(BuildContext context) => Navigator.of(context).pop();
}
