import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:padora/auth/login/block/validator_login.dart';
import 'package:padora/utils/constants/route_constansts.dart';
import 'package:padora/utils/navigation.dart';
import 'package:rxdart/rxdart.dart';


class LoginBlock extends Object with ValidatorLogin implements BaseBloc{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream => _password.stream.transform(validatePassword);
  Stream<bool>   get submitValue =>  Observable.combineLatest2(emailStream, passwordStream, (a, b)=> true);

  Function(String) get ChangeEmail => _email.sink.add;
  Function(String) get ChangePassword => _password.sink.add;

  submitLogin(BuildContext context){
    NavigationUtils.push(context, ROUTE_REGISTER);
  }
  dispose() {
    _email.close();
    _password.close();
  }



}

abstract class BaseBloc {
  void dispose();
}