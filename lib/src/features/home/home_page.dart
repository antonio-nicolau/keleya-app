import 'package:flutter/material.dart';
import 'package:keleya_app/src/features/profile/profile_page.dart';
import 'package:keleya_app/src/features/signin/page/signin_page.dart';
import 'package:keleya_app/src/features/signup/pages/signup_page.dart';
import 'package:keleya_app/src/shared/controllers/localStorage.dart';
import 'package:keleya_app/src/shared/utils/page_navigator.dart';
import 'package:keleya_app/src/shared/widgets/custom_button.dart';
import 'package:keleya_app/src/shared/widgets/title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title(context, AppLocalizations.of(context)!.homeTitle),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40),
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customButton(context,
                      label: AppLocalizations.of(context)!.homeBtn1,
                      callBack: _goToLogin),
                  customButton(
                    context,
                    label: AppLocalizations.of(context)!.homeBtn2,
                    textColor: Theme.of(context).primaryColor,
                    background: Theme.of(context).secondaryHeaderColor,
                    callBack: () => nextPage(context, SignUpPage()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _goToLogin() async {
    final token = await LocalStorage().getLocalToken();

    if (token?.isNotEmpty == true)
      nextPage(context, ProfilePage());
    else
      nextPage(context, SignInPage());
  }
}
