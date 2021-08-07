import 'package:flutter/material.dart';

title(context, title, {textColor, width}) {
  return Container(
    width: width ?? MediaQuery.of(context).size.width * 0.8,
    padding: EdgeInsets.only(top: 15),
    child: Text(
      '$title',
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(color: textColor ?? Theme.of(context).accentColor),
      textAlign: TextAlign.center,
    ),
  );
}
