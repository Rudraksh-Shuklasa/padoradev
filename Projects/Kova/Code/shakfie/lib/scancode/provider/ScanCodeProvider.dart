import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shakfie/bash/Navigation.dart';

import 'package:shakfie/registration/model/RegistrationReq.dart';
import 'package:toast/toast.dart';

class ScanCodeProvider with ChangeNotifier {
  bool isLoading = false;

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }


  void saveCard(BuildContext context){

  }

}
