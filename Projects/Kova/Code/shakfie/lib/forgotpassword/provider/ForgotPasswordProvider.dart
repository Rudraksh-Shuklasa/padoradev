import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/bash/Screens.dart';
import 'package:shakfie/forgotpassword/model/ForgotPasswordModel.dart';
import 'package:shakfie/login/model/LoginReq.dart';
import 'package:toast/toast.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool isLoading = false;

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }

  void forgotPasswordApi(BuildContext context, ForgotPasswordModel _forgotPasswordReq) {
    isLoading = false;
    Toast.show("done", context);

  }


}
