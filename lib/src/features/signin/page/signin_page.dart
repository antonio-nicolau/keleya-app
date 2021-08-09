import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keleya_app/src/features/profile/profile_page.dart';
import 'package:keleya_app/src/features/signin/widget/forgot_password.dart';
import 'package:keleya_app/src/shared/repository/UserRepository.dart';
import 'package:keleya_app/src/shared/service/UserService.dart';
import 'package:keleya_app/src/shared/utils/page_navigator.dart';
import 'package:keleya_app/src/shared/widgets/custom_button.dart';
import 'package:keleya_app/src/shared/widgets/custom_input.dart';
import 'package:keleya_app/src/shared/widgets/custom_snackbar.dart';
import 'package:keleya_app/src/shared/widgets/subTitle.dart';
import 'package:keleya_app/src/shared/widgets/title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  static final _formState = GlobalKey<FormState>();
  late UserService _service;

  @override
  void initState() {
    _service = UserService(UserRepository());
    super.initState();
  }

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
                title(context, AppLocalizations.of(context)!.signinTitle),
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
                        subTitle(
                          context,
                          AppLocalizations.of(context)!.signinSubtitle,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                        CustomInput(
                          controller: _emailController,
                          labelText: 'Email',
                        ),
                        CustomInput(
                          controller: _passwordController,
                          isPassword: true,
                          labelText: 'Password',
                          showButtonViewText: true,
                        ),
                        forgotPassword(context),
                        SizedBox(height: 20),
                        customButton(
                          context,
                          label: AppLocalizations.of(context)!.btnSignin,
                          callBack: _callBack,
                        ),
                        SizedBox(height: 15),
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

  Future<void> _callBack() async {
    if (_formState.currentState?.validate() == true) {
      showSnackBar(context, AppLocalizations.of(context)!.loading,
          duration: Duration(seconds: 1));
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final response = await _service.signIn(email, password);

      if (response == 'sucess') {
        Navigator.pop(context);
        nextPage(context, ProfilePage(),
            params: AppLocalizations.of(context)!.loginSucess);
      } else
        showSnackBar(context, response);
    }
  }
}
