import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shakfie/registration/model/RegistrationReq.dart';
import 'package:toast/toast.dart';

class RegistrationProvider with ChangeNotifier {
  bool isLoading = false;

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }

  void registerApiCall(BuildContext context, RegistrationReq _signUpReq) {
    isLoading = false;
    Toast.show("done", context);
//      Navigation.pushAndRemoveUntil(context, Screens.HOME);
  }

}
