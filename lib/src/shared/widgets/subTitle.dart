import 'package:flutter/material.dart';

subTitle(context, title, {width, textColor, textSize, paddingBottom}) {
  return Container(
    width: width ?? MediaQuery.of(context).size.width * 0.7,
    padding: EdgeInsets.only(top: 60, bottom: paddingBottom ?? 75),
    child: Text(
      '$title',
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: textColor ?? Theme.of(context).shadowColor,
            fontSize: textSize ?? 19,
          ),
      textAlign: TextAlign.center,
    ),
  );
}
