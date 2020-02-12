import 'package:flutter/material.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/bash/Screens.dart';
import 'package:shakfie/bash/style/common_styles.dart';
import 'package:shakfie/bash/widgets/ProcessDialog.dart';
import 'package:shakfie/forgotpassword/model/ForgotPasswordModel.dart';
import 'package:shakfie/forgotpassword/provider/ForgotPasswordProvider.dart';


class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  var _userEmailController = TextEditingController();
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  var provider = ForgotPasswordProvider();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:   Container(
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child:   Container(
              margin: EdgeInsets.fromLTRB(16, 52, 16, 72),
              child: Column(
                children: <Widget>[
                  buildLogo(),
                  buildGap(12),
                  buildAccountTitle(context),
                  buildGap(8),
                  buildEmailField(context),
                  _buildResetButton(context),
                  _buildBackToLoginButton(context)

                ],
              ),
            ),
          )
      ),
    );
  }

  Widget buildGap(double height){
    return SizedBox(
      height: height,
    );
  }
  Widget buildLogo(){
    return Align(
      alignment: Alignment.topLeft,
      child: Image.asset(
        "assets/images/logo.png",
        height: 100,
        width: 100,
      ),
    );
  }

  Widget buildAccountTitle(BuildContext context){
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child:Text(
          "Forgot password",
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );

  }

  Widget buildEmailField(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: TextFormField(
          controller: _userEmailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,

          validator: (value) => _emailValidation(value),
          decoration: CommonStyles.textFormFieldStyle("", "Email",Icons.alternate_email,context)
      ),
    );
  }

  String _emailValidation(String value) {
    bool emailValid =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if (!emailValid) {
      return "Enter valid email address";
    } else {
      return null;
    }
  }


  Widget _buildResetButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 8.0,left: 8.0),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
              side: BorderSide(color: Theme.of(context).primaryColor)
          ),
          color: Theme.of(context).primaryColor,
          child: Text(
              "Reset Password",
              style: Theme.of(context).textTheme.display1),
          onPressed: () => {
            _forgotPasswordProcess(context)
          },
        ),
      ),
    );
  }

  void _forgotPasswordProcess(BuildContext context) {
    var validate = _formKey.currentState.validate();

    if (validate) {
      provider.setLoading();
      ProcessDialog.openLoadingDialog(context);
      ForgotPasswordModel _forgotPassword = ForgotPasswordModel(
          email: _userEmailController.text);
      provider.forgotPasswordApi(context, _forgotPassword);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }


  Widget _buildBackToLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
      child: Container(
        width: double.infinity,
        child: FlatButton(
          padding: EdgeInsets.all(12),
          clipBehavior: Clip.antiAlias ,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          color: Colors.white,
          child: Text(
              "Back To Login",
              style: Theme.of(context).textTheme.display2),
          onPressed: () => {
            _backToLogin(context)
          },
        ),
      ),
    );
  }

  void _backToLogin(BuildContext context){
    Navigation.pushReplacement(context, Screens.LOGIN);
  }
}
