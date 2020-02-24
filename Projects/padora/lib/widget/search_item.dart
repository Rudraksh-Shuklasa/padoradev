import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padora/utils/constants/image_constansts.dart';
class SearchItem extends StatefulWidget {
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 56,
      margin: EdgeInsets.only(left: 8,top: 12),
      child: Container(
        padding: EdgeInsets.only(top: 8),
        child: Row(
          children: <Widget>[
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IC_CLOATHS),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Boys Tshirt",style: GoogleFonts.pTSerifCaption(
                  textStyle: TextStyle(color: Colors.black, fontSize: 12),
                ),),
                Text("Cloths Category",style: GoogleFonts.pTSerifCaption(
                  textStyle: TextStyle(color: Colors.black, fontSize: 10),
                ),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
