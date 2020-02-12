import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shakfie/cardlist/model/CardDetail.dart';

class CardListProvider with ChangeNotifier {
  bool isLoading = false;
  List<CardDetail> cards = List();

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }

  void saveCard(BuildContext context) {}

  void getCardList(BuildContext context) {
    isLoading = true;
    this.cards.clear();
    this.cards.add(CardDetail(
        FontAwesomeIcons.ccVisa, "XXXX XXXX XXXX 46", "12/202", true));
    this.cards.add(CardDetail(
        FontAwesomeIcons.ccMastercard, "XXXX XXXX XXXX 46", "12/202", false));
    this.cards.add(CardDetail(
        FontAwesomeIcons.ccDinersClub, "XXXX XXXX XXXX 46", "12/202", false));
    this.cards.add(CardDetail(
        FontAwesomeIcons.ccDiscover, "XXXX XXXX XXXX 46", "12/202", false));
    isLoading = false;
    notifyListeners();
    print("===Success $cards");
  }
}
