import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shakfie/cardlist/model/CardDetail.dart';
import 'package:shakfie/receiptlist/model/ReceiptDetails.dart';

class ReceiptItem extends StatefulWidget {
  final int index;
  final ReceiptDetails _receiptDetails;

  // final String title;
  // final String imageUrl;

  ReceiptItem(this.index, this._receiptDetails);

  @override
  _ReceiptItemState createState() => _ReceiptItemState();
}

class _ReceiptItemState extends State<ReceiptItem> {
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

            ],
          ),
          _buildDefualtLogo()



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
      child: Icon(widget._receiptDetails.icon,size: 24,),

    );


  }

  Widget _buildCardNumberAndExpiryDate(){
    return Container(
      padding: EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget._receiptDetails.date,style: TextStyle(color: Colors.black,fontSize: 16),),
          SizedBox(height: 8,),
          Text(widget._receiptDetails.status,style: TextStyle(color: Colors.grey,fontSize: 14),)
        ],
      ),
    );

  }



  Widget _buildDefualtLogo(){
      return ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child:Container(
            color: widget._receiptDetails.isSuccsess? Colors.green:Colors.red,
            child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 6,bottom: 6),
                child:Text(widget._receiptDetails.amount,style: TextStyle(fontSize: 12,color: Colors.white) ,
                )

            ),

          )
      );


  }
}
