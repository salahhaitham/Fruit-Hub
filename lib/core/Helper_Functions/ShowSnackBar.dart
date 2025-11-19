import 'package:flutter/material.dart';

ScaffoldMessengerState showSnackBar(BuildContext context,String text) {

  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
        SnackBar(content: Text(text))
    );
}