import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/receiptlist/model/ReceiptDetails.dart';

import 'package:shakfie/registration/model/RegistrationReq.dart';
import 'package:toast/toast.dart';

class ReceiptListProvider with ChangeNotifier {
  bool isLoading = false;
  List<ReceiptDetails> receipts = List();

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }


  void saveCard(BuildContext context){

  }

  void getCardList(BuildContext context) {
    isLoading = true;
    this.receipts.clear();
    this.receipts.add(ReceiptDetails(FontAwesomeIcons.receipt,"19 jan 2020","Payment successful",true,"12.32"));
    this.receipts.add(ReceiptDetails(FontAwesomeIcons.receipt,"18 jan 2020","Payment failed",false,"12.32"));
    this.receipts.add(ReceiptDetails(FontAwesomeIcons.receipt,"17 jan 2020","Payment successful",true,"12.32"));
    this.receipts.add(ReceiptDetails(FontAwesomeIcons.receipt,"16 jan 2020","Payment successful",true,"12.32"));
    isLoading = false;
    notifyListeners();
    print("===Success $receipts");
  }
}
