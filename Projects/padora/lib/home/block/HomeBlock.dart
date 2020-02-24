import 'package:flutter/cupertino.dart';
import 'package:padora/home/model/demo_cart.dart';
import 'package:rxdart/rxdart.dart';

class HomeBlock  {
  final listBlock = BehaviorSubject<List<DemoCart>>();

  final listSearchItem=BehaviorSubject<int>();


  Stream<int> get listSearchItemStream => listSearchItem.stream;



  Function(int) get listSearchItemSink => listSearchItem.sink.add;


  Stream<List<DemoCart>> get listBlockStream => listBlock.stream;



  Function(List<DemoCart>) get listBlockSink => listBlock.sink.add;



  dispose() {
    listBlock.close();

  }






}

