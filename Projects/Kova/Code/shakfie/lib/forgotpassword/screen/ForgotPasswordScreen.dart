import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakfie/forgotpassword/provider/ForgotPasswordProvider.dart';
import 'package:shakfie/forgotpassword/widget/ForgotPasswordForm.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ChangeNotifierProvider.value(value: ForgotPasswordProvider(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: ForgotPasswordForm(),
          ),
        )
    );
  }
}
