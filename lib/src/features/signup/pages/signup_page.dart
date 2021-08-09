import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:keleya_app/src/features/add_name/add_name_page.dart';
import 'package:keleya_app/src/features/signup/widgets/already_have_account.dart';
import 'package:keleya_app/src/features/signup/widgets/custom_checkbox.dart';
import 'package:keleya_app/src/shared/controllers/validate.dart';
import 'package:keleya_app/src/shared/models/UserModel.dart';
import 'package:keleya_app/src/shared/utils/page_navigator.dart';
import 'package:keleya_app/src/shared/widgets/custom_button.dart';
import 'package:keleya_app/src/shared/widgets/custom_input.dart';
import 'package:keleya_app/src/shared/widgets/custom_snackbar.dart';
import 'package:keleya_app/src/shared/widgets/subTitle.dart';
import 'package:keleya_app/src/shared/widgets/title.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool acceptPolicy = false;
  bool acceptTerms = false;
  static final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: title(
                    context,
                    AppLocalizations.of(context)!.signupTitle,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Form(
                    key: _formState,
                    child: Column(
                      children: [
                        subTitle(context,
                            AppLocalizations.of(context)!.signupSubtitle),
                        CustomInput(
                          controller: _emailController,
                          labelText: 'Your Email',
                        ),
                        CustomInput(
                          controller: _passwordController,
                          isPassword: true,
                          labelText: 'Password',
                          showButtonViewText: true,
                        ),
                        CustomInput(
                          controller: _confirmPasswordController,
                          isPassword: true,
                          labelText: 'Confirm password',
                          showButtonViewText: true,
                        ),
                        customButton(
                          context,
                          label: AppLocalizations.of(context)!.btnSignup,
                          spaceBetwen: 15.0,
                          callBack: _callBack,
                        ),
                        customCheckBox(
                            context,
                            AppLocalizations.of(context)!.checkboxPrivacyPolicy,
                            acceptPolicy, (value) {
                          setState(() {
                            acceptPolicy = value;
                          });
                        }),
                        customCheckBox(
                            context,
                            AppLocalizations.of(context)!
                                .checkboxTermsCondition,
                            acceptTerms, (value) {
                          setState(() {
                            acceptTerms = value;
                          });
                        }),
                        alreadyHaveAccount(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _callBack() {
    if (_formState.currentState?.validate() == true) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final _confirmPassword = _confirmPasswordController.text.trim();

      final passwordState = Validate.isValidPasswords(
        context,
        password,
        _confirmPassword,
      );

      if (passwordState == 'ok') {
        if (didAcceptTerms()) {
          final user = UserModel(
            email: email,
            password: password,
            acceptPrivatePolicy: acceptPolicy,
            acceptTermConditions: acceptTerms,
          );
          nextPage(context, AddNamePage(), params: user);
        } else
          showSnackBar(context, AppLocalizations.of(context)!.errorAcceptTerms);
      } else
        showSnackBar(context, passwordState);
    }
  }

  bool didAcceptTerms() {
    if (!acceptPolicy)
      return false;
    else if (!acceptTerms) return false;
    return true;
  }
}
