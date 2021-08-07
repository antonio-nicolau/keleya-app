import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextPage(context, page, {params}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => page,
      settings: RouteSettings(
        arguments: params,
      ),
    ),
  );
}
