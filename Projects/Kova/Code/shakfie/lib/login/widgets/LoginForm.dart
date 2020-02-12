import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/bash/Screens.dart';
import 'package:shakfie/bash/style/common_styles.dart';
import 'package:shakfie/bash/widgets/ProcessDialog.dart';
import 'package:shakfie/login/model/LoginReq.dart';
import 'package:shakfie/login/provider/LoginProvider.dart';

import '../../bash/AppConfig.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AppConfig _ac;
  var _userEmailController = TextEditingController();
  var _userPasswordController = TextEditingController();
  var _emailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = true;
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  var provider = LoginProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 72, 16, 108),
        child: Column(
          children: <Widget>[
            buildLogo(),
            buildGap(36),
            buildEmailField(context),
            buildGap(18),
            _buildPasswordField(context),
            _buildSignInButton(context),
            _buildForgotPasswordWidget(context),
            _buildOrLineComponenet(context),
            _buildSignUpButton(context)
          ],
        ),
      ),
    ));
  }

  Widget buildGap(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Image.asset(
        "assets/images/logo.png",
        height: 100,
        width: 100,
      ),
    );
  }

  Widget buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: TextFormField(
          controller: _userEmailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          validator: (value) => _emailValidation(value),
          decoration: CommonStyles.textFormFieldStyle(
              "", "Email", Icons.alternate_email, context)),
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

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: TextFormField(
        controller: _userPasswordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        validator: (value) => _validatePassword(value),
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
          contentPadding: EdgeInsets.all(12),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          )),
          suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              }),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordWidget(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
          onPressed: () => {goToForgotPassword(context)},
          child: Text(
            'Forgot password',
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.w500),
          )),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 8.0, left: 8.0),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
              side: BorderSide(color: Theme.of(context).primaryColor)),
          color: Theme.of(context).primaryColor,
          child: Text("Login", style: Theme.of(context).textTheme.display1),
          onPressed: () => {_signUpProcess(context)},
        ),
      ),
    );
  }

  Widget _buildOrLineComponenet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
      child: Row(children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Text(
            "OR",
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ),
        Expanded(child: Divider()),
      ]),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
      child: Container(
        width: double.infinity,
        child: FlatButton(
          padding: EdgeInsets.all(12),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          color: Colors.white,
          child: Text("Create an account",
              style: Theme.of(context).textTheme.display2),
          onPressed: () => {
            goToSignup(context)
          },
        ),
      ),
    );
  }

  String _validatePassword(String value) {
    if (value.isEmpty)
      return "Please enter password";
    else
      return null;
  }

  void _signUpProcess(BuildContext context) {
    var validate = _formKey.currentState.validate();

    if (validate) {
      provider.setLoading();
      ProcessDialog.openLoadingDialog(context);
      LoginReq _signInReq = LoginReq(
          email: _userEmailController.text,
          password: _userPasswordController.text);
      provider.loginApiCall(context, _signInReq);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void goToSignup(BuildContext context) {
    Navigation.pushReplacement(context, Screens.SINGUP);
  }

  void goToForgotPassword(BuildContext context) {
    Navigation.pushReplacement(context, Screens.FORGOTPASSWORD);
  }
}


