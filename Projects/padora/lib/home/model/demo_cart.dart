import 'package:flutter/material.dart';
class DemoCart extends StatefulWidget {
  BoxDecoration boxDecoration;
  DemoCart(this.boxDecoration);
  @override
  _DemoCartState createState() => _DemoCartState();
}

class _DemoCartState extends State<DemoCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(56),
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: widget.boxDecoration,
    );
  }
}
