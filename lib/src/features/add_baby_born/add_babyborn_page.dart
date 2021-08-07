import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keleya_app/src/features/congratulation/congratulation_page.dart';
import 'package:keleya_app/src/models/UserModel.dart';
import 'package:keleya_app/src/repository/UserRepository.dart';
import 'package:keleya_app/src/service/UserService.dart';
import 'package:keleya_app/src/shared/utils/page_navigator.dart';
import 'package:keleya_app/src/shared/widgets/custom_button.dart';
import 'package:keleya_app/src/shared/widgets/custom_snackbar.dart';
import 'package:keleya_app/src/shared/widgets/subTitle.dart';
import 'package:keleya_app/src/shared/widgets/title.dart';

import 'widget/show_datetext_widget.dart';

class AddBabyBornPage extends StatefulWidget {
  AddBabyBornPage({Key? key}) : super(key: key);

  @override
  _AddBabyBornPageState createState() => _AddBabyBornPageState();
}

class _AddBabyBornPageState extends State<AddBabyBornPage> {
  static final lastDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  String? dateToShow;
  late UserService _service;
  late UserModel user;

  @override
  void initState() {
    _service = UserService(UserRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dateToShow = _formatDate(_selectedDate);

    user = ModalRoute.of(context)!.settings.arguments as UserModel;

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
          label: 'Next question',
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
                'When was your baby born?',
                width: MediaQuery.of(context).size.width * 0.9,
                textColor: Theme.of(context).shadowColor,
              ),
              subTitle(
                context,
                'This well help us give you relevant tips to care yourself & your baby',
                width: MediaQuery.of(context).size.width * 0.95,
                textColor: Theme.of(context).shadowColor.withOpacity(0.6),
                textSize: 18.0,
                paddingBottom: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    showDateText(context, dateToShow, _chooseDate),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _callBack()async {
    user.babyBirthDate = _selectedDate;
    user.onboardingDone=true;

    showSnackBar(context,'Loading...', duration: Duration(seconds: 1));
    final response = await _service.createUser(user);

    if (response == 'sucess') {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      nextPage(context, CongratulationPage());
    } else
      showSnackBar(context,response);
  }

  Future<void> _chooseDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1995),
      lastDate: lastDate,
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        dateToShow = _formatDate(_selectedDate);
      });
  }

  _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd.MM.yy');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
