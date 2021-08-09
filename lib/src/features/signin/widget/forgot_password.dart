import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

forgotPassword(context) {
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        AppLocalizations.of(context)!.forgotPassword,
        style: TextStyle(
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          fontSize: 12,
        ),
        textAlign: TextAlign.right,
      ),
    ),
  );
}
