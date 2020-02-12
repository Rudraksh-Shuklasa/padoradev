import 'package:flutter/material.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/bash/Screens.dart';
import 'package:shakfie/bash/style/common_styles.dart';
import 'package:shakfie/bash/widgets/ProcessDialog.dart';
import 'package:shakfie/registration/model/RegistrationReq.dart';
import 'package:shakfie/registration/provider/RegistrationProvider.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  var _userEmailController = TextEditingController();
  var _userPasswordController = TextEditingController();
  var _userNameController=TextEditingController();

  var _emailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  var _userNameFocusNode=FocusNode();

  bool _isPasswordVisible = true;
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  var provider = RegistrationProvider();

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
                  buildGap(18),
                  buildAccountTitle(context),
                  buildGap(12),
                  buildUserField(context),
                  buildGap(12),
                  buildEmailField(context),
                  buildGap(12),
                  _buildPasswordField(context),
                  _buildSignUpButton(context),
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
        "Create an account",
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
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          validator: (value) => _emailValidation(value),
          decoration: CommonStyles.textFormFieldStyle("", "Email",Icons.alternate_email,context)
      ),
    );
  }

  Widget buildUserField(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: TextFormField(
          controller: _userNameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          validator: (value) => _userNameValidation(value),
          decoration: CommonStyles.textFormFieldStyle("", "Full name",Icons.person,context)
      ),
    );
  }

  String _userNameValidation(String value)
  {
    if(value.isEmpty)
      return "Please enter username";
    else
      return null;
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
        validator: (value)=>_validatePassword(value),
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: "Your email",
          hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
          contentPadding: EdgeInsets.all(12),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,)
          ),
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



  Widget _buildSignUpButton(BuildContext context) {
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
              "Sign up",
              style: Theme.of(context).textTheme.display1),
          onPressed: () => {
            _signUpProcess(context)
          },
        ),
      ),
    );
  }



  Widget _buildBackToLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
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
          onPressed: () => {_backToLogin(context)},
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
      RegistrationReq _signInReq = RegistrationReq(
          email: _userEmailController.text,
          password: _userPasswordController.text);
      provider.registerApiCall(context, _signInReq);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _backToLogin(BuildContext context){
    Navigation.pushReplacement(context, Screens.LOGIN);
  }
}
