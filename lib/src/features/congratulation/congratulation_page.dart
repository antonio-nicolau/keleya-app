import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:keleya_app/src/shared/widgets/title.dart';

class CongratulationPage extends StatefulWidget {
  CongratulationPage({Key? key}) : super(key: key);

  @override
  _CongratulationPageState createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 70, 15, 0),
              child: title(
                context,
                AppLocalizations.of(context)!.congratulationTitle,
                width: MediaQuery.of(context).size.width,
                textColor: Theme.of(context).shadowColor,
              ),
            ),
            SizedBox(height: 50),
            Image.asset(
              'images/congratulation.png',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
