import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customButton(context,
    {label, background, textColor, spaceBetwen, Function? callBack}) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.9,
    margin: EdgeInsets.only(top: spaceBetwen ?? 40),
    child: ElevatedButton(
      onPressed: () => callBack!(),
      child: Text(
        '$label',
        style: TextStyle(
          color: textColor ?? Theme.of(context).accentColor.withOpacity(0.7),
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              background ?? Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ))),
    ),
  );
}
