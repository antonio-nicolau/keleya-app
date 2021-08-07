import 'package:flutter/material.dart';

forgotPassword(context) {
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        'Forgot your password?',
        style: TextStyle(
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          fontSize: 12,
        ),
        textAlign: TextAlign.right,
      ),
    ),
  );
}
