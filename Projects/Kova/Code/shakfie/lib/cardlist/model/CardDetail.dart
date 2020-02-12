import 'package:flutter/cupertino.dart';

class CardDetail {
  IconData icon;
  String cardNumber;
  String expiryDate;
  bool isDefualt;


  CardDetail(this.icon,this.cardNumber,this.expiryDate,this.isDefualt);

  CardDetail.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    cardNumber = json['cardNumber'];
    expiryDate = json['expiryDate'];
    isDefualt = json['isDefualt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['cardNumber'] = this.cardNumber;
    data['expiryDate'] = this.expiryDate;
    data['isDefualt'] = this.isDefualt;
    return data;
  }
}