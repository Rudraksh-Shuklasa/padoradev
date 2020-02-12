import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/bash/Screens.dart';
import 'package:shakfie/login/model/LoginReq.dart';
import 'package:toast/toast.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }

  void loginApiCall(BuildContext context, LoginReq _signInReq) {
    isLoading = false;
    Toast.show("done", context);
    Navigation.pushAndRemoveUntil(context, Screens.ADDCARD);

  }



}
