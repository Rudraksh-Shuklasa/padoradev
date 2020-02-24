import 'package:flutter/material.dart';
import 'package:padora/utils/constants/image_constansts.dart';
class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
            padding:EdgeInsets.only(top: 16,right: 16,left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Container(
                  height: 132,
                  width: 78,
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        height: 24,
                        width: 24,
                        color: Colors.yellow,
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(child: Icon(Icons.flash_on,size: 8,)),
                            Center(child: Text("64%",style: TextStyle(fontSize: 8),),)
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(IC_CLOATHS),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text("US 2.90",style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold),),
                SizedBox(height: 2,),
                Text("US 8.90",style: TextStyle(fontSize: 10,color: Colors.black26,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),)

              ],
            )
        )
      ],
    );
  }
}
