import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shakfie/cardlist/model/CardDetail.dart';

class CardItem extends StatefulWidget {
  final int index;
  final CardDetail card;

  // final String title;
  // final String imageUrl;

  CardItem(this.index, this.card);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top: 24) ,
      padding: EdgeInsets.only(right: 8,left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildCardLogo(),
              _buildCardNumberAndExpiryDate(),
              _buildDefualtLogo()
            ],
          ),
          Icon(Icons.more_horiz,size: 24,)


        ],
      ),
    );
  }

  Widget _buildCardLogo(){
    return Container(
                height: 38,
                width: 38,
                decoration: new BoxDecoration(
                   shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                ),
                   child: Icon(widget.card.icon,size: 24,),

      );


  }

  Widget _buildCardNumberAndExpiryDate(){
    return Container(
        padding: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.card.cardNumber,style: TextStyle(color: Colors.black,fontSize: 16,decoration: TextDecoration.none,)),
            SizedBox(height: 8,),
            Text("Expiring on "+widget.card.expiryDate,style: TextStyle(color: Colors.grey,fontSize: 14,decoration: TextDecoration.none),)
          ],
        ),
    );

  }



  Widget _buildDefualtLogo(){
    if(widget.card.isDefualt)
      {
        return Padding(
            padding: EdgeInsets.only(left: 12),
          child:ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child:Container(
                color: Colors.green,
                child: Padding(
                    padding: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                    child:Text("DEFAULT",style: TextStyle(fontSize: 10,color: Colors.white,decoration: TextDecoration.none) ,
                    )

                ),

              )
          ) ,
        );

      }
    else{
      return Container();
    }

  }
}
