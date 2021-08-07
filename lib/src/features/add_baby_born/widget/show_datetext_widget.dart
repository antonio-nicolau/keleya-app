import 'package:flutter/material.dart';

showDateText(context,date,Function callBack){
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: 55,
    child: TextButton(
      onPressed: () => callBack(context),
      child: Text(
        '$date',
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context)
              .shadowColor
              .withOpacity(0.6),
        ),
      ),
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        shape: MaterialStateProperty.all<
            RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: Theme.of(context).dividerColor),
          ),
        ),
      ),
    ),
  );
}