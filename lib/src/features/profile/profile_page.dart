import 'package:flutter/material.dart';
import 'package:keleya_app/src/controllers/localStorage.dart';
import 'package:keleya_app/src/shared/widgets/custom_button.dart';
import 'package:keleya_app/src/shared/widgets/subTitle.dart';
import 'package:keleya_app/src/shared/widgets/title.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments;

    void _callBack() async {
      final response = await LocalStorage().removeToken();
      if (response == true) Navigator.pop(context);
      else
        print('ok');
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).accentColor,
      ),
      bottomSheet: Container(
        height: 100,
        alignment: Alignment.topCenter,
        child: customButton(
          context,
          spaceBetwen: 0.0,
          background: Theme.of(context).errorColor,
          label: 'Sign out',
          callBack: _callBack,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 160,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              title(
                context,
                'Profile',
                width: MediaQuery.of(context).size.width * 0.9,
                textColor: Theme.of(context).shadowColor,
              ),
              subTitle(
                context,
                params ?? 'Welcome back',
                width: MediaQuery.of(context).size.width * 0.95,
                textColor: Theme.of(context).shadowColor.withOpacity(0.6),
                textSize: 18.0,
                paddingBottom: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
