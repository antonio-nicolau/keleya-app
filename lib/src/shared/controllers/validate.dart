import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validate {
  static bool? isEmail(String email) {
    final reg =
        r"^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$";
    return RegExp(reg).hasMatch(email);
  }

  static String? isValidPasswords(
      context, String password, String confirmPassword) {
    if (password.length < 6)
      return AppLocalizations.of(context)!.errorWeakPassword;
    else if (password != confirmPassword)
      return AppLocalizations.of(context)!.errorPasswordMuch;
    return 'ok';
  }
}
