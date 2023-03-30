import 'package:flutter/material.dart';

class SnackBarService {
  static const errorMessage = Colors.lightGreen;
  static const isSuccess = Colors.red;

  SnackBarService(String s, BuildContext context);

  static Future<void> showSnackBar(
      BuildContext context, String message, bool error) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: error ? errorMessage : isSuccess,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}