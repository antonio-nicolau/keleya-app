import 'package:flutter/material.dart';

customCheckBox(context, label, bool isChecked, Function callBack) {
  return Container(
    child: Row(
      children: [
        Checkbox(
          value: isChecked,
          checkColor: Theme.of(context).primaryColor,
          onChanged: (value) => callBack(value),
        ),
        Row(
          children: [
            Text(
              'I accept the',
              style: TextStyle(
                  color: Theme.of(context).shadowColor.withOpacity(0.6)),
            ),
            SizedBox(width: 5),
            Text(
              '$label',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
              maxLines: 1,
            ),
          ],
        )
      ],
    ),
  );
}
