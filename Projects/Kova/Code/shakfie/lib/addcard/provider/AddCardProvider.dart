import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/bash/Screens.dart';

import 'package:shakfie/registration/model/RegistrationReq.dart';
import 'package:toast/toast.dart';

class AddCardProvider with ChangeNotifier {
  bool isLoading = false;

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }


  void saveCard(BuildContext context){
    Navigation.pushReplacement(context, Screens.GET_CARD_LIST,arguments: true);
  }

}
