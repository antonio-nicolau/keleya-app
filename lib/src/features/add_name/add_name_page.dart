import 'package:flutter/material.dart';
import 'package:keleya_app/src/features/add_baby_born/add_babyborn_page.dart';
import 'package:keleya_app/src/shared/models/UserModel.dart';
import 'package:keleya_app/src/shared/utils/page_navigator.dart';
import 'package:keleya_app/src/shared/widgets/custom_button.dart';
import 'package:keleya_app/src/shared/widgets/custom_input.dart';
import 'package:keleya_app/src/shared/widgets/title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNamePage extends StatelessWidget {
  final _nameController = TextEditingController();
  static final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;

    _callBack() {
      if (_formState.currentState?.validate() == true) {
        user.name = _nameController.text.trim();
        nextPage(context, AddBabyBornPage(), params: user);
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).accentColor,
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
                AppLocalizations.of(context)!.addNameTitle,
                width: MediaQuery.of(context).size.width * 0.9,
                textColor: Theme.of(context).shadowColor,
              ),
              SizedBox(height: 40),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  margin: EdgeInsets.only(top: 30),
                  child: Form(
                    key: _formState,
                    child: Column(
                      children: [
                        CustomInput(
                          controller: _nameController,
                          labelText: 'Name',
                        ),
                        customButton(
                          context,
                          label: AppLocalizations.of(context)!.nextQuestion,
                          callBack: _callBack,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
