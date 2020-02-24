import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickSearchItem extends StatefulWidget {
  IconData imageIcon;
  String title;
  QuickSearchItem(this.imageIcon,this.title);

  @override
  _QuickSearchItemState createState() => _QuickSearchItemState();
}

class _QuickSearchItemState extends State<QuickSearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              height: 48,
              width: 48,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ]),
              child: Icon(
                widget.imageIcon,
                size: 24,
              ),
            ),
            SizedBox(height: 12,),
            Text(widget.title,style: GoogleFonts.pTSerifCaption(
              textStyle: TextStyle(color: Colors.black, fontSize: 12),)),
          ],
        ),
      ),
    );
  }
}
