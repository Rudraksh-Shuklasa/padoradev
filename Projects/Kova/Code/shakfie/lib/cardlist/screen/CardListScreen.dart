import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakfie/bash/Navigation.dart';
import 'package:shakfie/bash/Screens.dart';
import 'package:shakfie/bash/widgets/CircularBorder.dart';
import 'package:shakfie/cardlist/provider/CardListProvider.dart';
import 'package:shakfie/cardlist/widget/carditem.dart';

class CardListScreen extends StatefulWidget {
  final bool isContinueButtonAllow;

  CardListScreen(this.isContinueButtonAllow);
  @override
  _CardListScreenState createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  CardListProvider _cardListProvider;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _cardListProvider = Provider.of<CardListProvider>(context);
      _cardListProvider.getCardList(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12, top: 12),
          child: Column(
            children: <Widget>[
              _buildGap(12),
              _buildLogo(context),
              _buildGap(18),
              _buildAddCard(context),
              _buildGap(18),
              Expanded(
                child: _buildCardList(context),
              ),
              _buildContinueButton(context)


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    if(widget.isContinueButtonAllow)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
          child: Container(
            width: double.infinity,
            child: RaisedButton(
              padding: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              color: Theme.of(context).primaryColor,
              child: Text("Continue", style: Theme.of(context).textTheme.display1),
              onPressed: () =>
              {
                _goTohome()
              },
            ),
          ),
        );
      }

    else{
      return Container(

      );
    }
  }

  void _goTohome() {
    Navigation.pushAndRemoveUntil(context, Screens.HOME);
  }


  Widget _buildCardList(BuildContext context) {
    return _cardListProvider == null || _cardListProvider.isLoading
        ? Center(child: Text("Loding"))
        : Container(
      child: ListView.builder(
        itemCount: _cardListProvider.cards.length,
        itemBuilder: (BuildContext ctx, int index) {
          return CardItem(index, _cardListProvider.cards[index]);
        },
      ),
    );
  }


  Widget _buildLogo(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Text(
          "Saved cards",
          style: Theme
              .of(context)
              .textTheme
              .subtitle,
        ),
      ),
    );
  }

  Widget _buildGap(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildAddCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircularBorder(
            width: 3,
            size: 38,
            color: Theme
                .of(context)
                .primaryColor,
            icon: Icon(Icons.add, color: Theme
                .of(context)
                .primaryColor, size: 24,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18, top: 4),
            child: Text("Add another card",
              style: TextStyle(color: Colors.black, fontSize: 16,decoration: TextDecoration.none),),
          )
        ],
      ),
    );
  }

}
