import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakfie/registration/provider/RegistrationProvider.dart';
import 'package:shakfie/registration/widget/RegistrationForm.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ChangeNotifierProvider.value(value: RegistrationProvider(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: RegistrationForm(),
          ),
        )
    );
  }
}
