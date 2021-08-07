import 'package:flutter/material.dart';

showSnackBar(context,response, {duration}) {
  final snackBar = SnackBar(
    content: Text('$response'),
    duration: duration ?? Duration(seconds: 4),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}