import 'package:flutter/cupertino.dart';
import 'package:padora/home/model/demo_cart.dart';
import 'package:rxdart/rxdart.dart';

class HomeBlock  {
  final listBlock = BehaviorSubject<List<DemoCart>>();



  Stream<List<DemoCart>> get listBlockStream => listBlock.stream;



  Function(List<DemoCart>) get listBlockSink => listBlock.sink.add;



  dispose() {
    listBlock.close();

  }






}

