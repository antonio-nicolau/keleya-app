import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

customCheckBox(context, label, bool isChecked, Function callBack) {
  return Row(
    children: [
      Checkbox(
        value: isChecked,
        checkColor: Theme.of(context).primaryColor,
        onChanged: (value) => callBack(value),
      ),
      Expanded(
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.checkboxPrefix,
              style: TextStyle(
                  color: Theme.of(context).shadowColor.withOpacity(0.6)),
            ),
            SizedBox(width: 5),
            Flexible(
              child: Text(
                '$label',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
