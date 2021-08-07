import 'package:flutter/material.dart';
import 'package:keleya_app/src/features/signin/page/signin_page.dart';
import 'package:keleya_app/src/shared/utils/page_navigator.dart';

alreadyHaveAccount(context){
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17),
        ),
        TextButton(
          onPressed: () => nextPage(context, SignInPage()),
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}