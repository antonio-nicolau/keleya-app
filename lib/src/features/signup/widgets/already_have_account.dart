import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:keleya_app/src/features/signin/page/signin_page.dart';
import 'package:keleya_app/src/shared/utils/page_navigator.dart';

alreadyHaveAccount(context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.alreadyHaveAccount,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        TextButton(
          onPressed: () => nextPage(context, SignInPage()),
          child: Text(
            AppLocalizations.of(context)!.btnSignin,
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
