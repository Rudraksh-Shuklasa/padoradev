import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakfie/addcard/provider/AddCardProvider.dart';
import 'package:shakfie/addcard/widget/AddCardForm.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ChangeNotifierProvider.value(value: AddCardProvider(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(16, 52, 16, 72),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildAccountTitle(context),
                  buildDescription(context),
                  AddCardForm()

                ],
              ),
            ),
          ),
        )
    );
  }


  Widget buildGap(double height){
    return SizedBox(
      height: height,
    );
  }

  Widget buildAccountTitle(BuildContext context){
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child:Text(
          "Add payment methode",
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );

  }

  Widget buildDescription(BuildContext context){
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child:Text(
          "Add your card details for make payments of the items you pick from the fridge",
          style: Theme.of(context).textTheme.display3,
          maxLines: 2,
        ),
      ),
    );

  }
}
