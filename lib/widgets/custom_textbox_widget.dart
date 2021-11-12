import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final bool obscureText;
  final VoidCallback? eyePressed;
  final String initialValue;

  const CustomTextWidget(
      {Key? key,
      this.obscureText = true,
      this.eyePressed,
      this.initialValue = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.red,        
        labelText: 'Custom Text2',
        //labelText: 'Custom Text',
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: eyePressed,
        ),
      ),
    );
  }
}
