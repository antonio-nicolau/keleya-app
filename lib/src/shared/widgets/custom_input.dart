import 'package:flutter/material.dart';
import 'package:keleya_app/src/controllers/validate.dart';

class CustomInput extends StatefulWidget {
  final String? labelText;
  bool? isPassword;
  final bool showButtonViewText;
  final bool isvalidated;
  final TextEditingController controller;
  final Function()? validated;
  final Function()? toggleObscureText;

  CustomInput({
    Key? key,
    required this.controller,
    this.labelText,
    this.isPassword = false,
    this.showButtonViewText = false,
    this.toggleObscureText,
    this.validated,
    this.isvalidated = false,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final double _sizeIcon = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
      ),
      child: TextFormField(
          keyboardType: _getKeyboardType(widget.labelText!),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: this.widget.labelText,
            labelStyle: TextStyle(color:Theme.of(context).dividerColor),
            suffix: this.widget.showButtonViewText
                ? this.widget.isPassword!
                    ? _buildIcon(Icons.visibility_off)
                    : _buildIcon(Icons.visibility)
                : null,
          ),
          controller: this.widget.controller,
          obscureText: this.widget.isPassword!,
          validator: (value) {
            if (value?.isEmpty == true)
              return 'Fill ${widget.labelText} field';
            else if (widget.labelText == 'Email' ||
                widget.labelText == 'Your Email') {
              if (Validate.isEmail(value.toString()) == false)
                return 'Insert a valid email';
            }
          }),
    );
  }

  TextInputType _getKeyboardType(String label) {
    if (label.contains('Email'))
      return TextInputType.emailAddress;
    else
      return TextInputType.text;
  }

  Widget _buildIcon(IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Icon(
          icon,
          size: this._sizeIcon,
        ),
        onTap: () => setState(() {
          this.widget.isPassword = !this.widget.isPassword!;
        }),
      ),
    );
  }
}
