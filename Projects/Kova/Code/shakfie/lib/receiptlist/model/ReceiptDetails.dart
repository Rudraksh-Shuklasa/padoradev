import 'package:flutter/cupertino.dart';

class ReceiptDetails {
  IconData icon;
  String date;
  String status;
  bool isSuccsess;
  String amount;


  ReceiptDetails(this.icon,this.date,this.status,this.isSuccsess,this.amount);

  ReceiptDetails.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    date = json['date'];
    status = json['status'];
    isSuccsess = json['isSuccsess'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['date'] = this.date;
    data['status'] = this.status;
    data['isSuccsess'] = this.isSuccsess;
    data['amount'] = this.amount;
    return data;
  }
}