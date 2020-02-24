import 'package:flutter/cupertino.dart';
import 'package:padora/home/model/demo_cart.dart';
import 'package:rxdart/rxdart.dart';

class ManScreenBlock  {
  final listArrivalBlock = BehaviorSubject<int>();



  Stream<int> get listBlockStream => listArrivalBlock.stream;



  Function(int) get listBlockSink => listArrivalBlock.sink.add;



  dispose() {
    listArrivalBlock.close();

  }






}

