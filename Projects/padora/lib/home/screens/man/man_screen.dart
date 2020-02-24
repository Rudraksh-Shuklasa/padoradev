import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padora/home/screens/man/block/ManScreenBlock.dart';
import 'package:padora/utils/constants/image_constansts.dart';
import 'package:padora/widget/carousel_widget.dart';
import 'package:padora/widget/product_item.dart';
import 'package:padora/widget/quick_search_item.dart';

class ManScreen extends StatefulWidget {
  @override
  _ManScreenState createState() => _ManScreenState();
}

class _ManScreenState extends State<ManScreen> {
  final bloc = ManScreenBlock();

  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.listBlockSink(15);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _getCarousel(),
          _getQuickSearchTitle(),
          _getFetureFashion(),
          _getFetureBrandSaleTitle(),
          _getFetureBrandSaleBanner(),
          _getNewArrivalBrandSaleTitle(),
          _getNewArrivalBrandSaleBanner(),
          _getNewArrivalNewArrivalItem(bloc),
          _getPedoraSaleTitle(),
          _getPedoraSaleBanner(),
          _getNewArrivalNewArrivalItem(bloc),









        ],

      ),
    );
  }



  Widget _getCarousel()
  {
    return  Padding(
        padding: EdgeInsets.only(bottom: 6.0),
        child: Column(children: [
          CarouselWidget(imgList),
        ]
        )
    );
  }

  Widget _getQuickSearchTitle()
  {
    return  Padding(
      padding:EdgeInsets.only(left: 24,right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Quick Search",style: GoogleFonts.pTSerifCaption(
            textStyle: TextStyle(color: Colors.black, fontSize: 14),)),
          MaterialButton(
            height: 24,
            minWidth: 12,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12)),
            onPressed: () {},
            child: Text("View All",style: GoogleFonts.pTSerifCaption(
              textStyle: TextStyle(color: Colors.black, fontSize: 8),)),
            color: Colors.black12,
          ),
        ],

      ),
    );
  }

  Widget _getFetureFashion()
  {
    return  Column(
      children: <Widget>[
        Padding(
          padding:EdgeInsets.only(left: 24,right: 24,top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              QuickSearchItem(Icons.shop,"Shop"),
              QuickSearchItem(Icons.create,"Create"),
              QuickSearchItem(Icons.cloud,"Cloud"),
              QuickSearchItem(Icons.people,"People"),
            ],
          ),
        ),
        Padding(
          padding:EdgeInsets.only(left: 24,right: 24,top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              QuickSearchItem(Icons.shop,"Shop"),
              QuickSearchItem(Icons.backup,"Backup"),
              QuickSearchItem(Icons.label,"Lable"),
              QuickSearchItem(Icons.games,"Games"),
            ],
          ),
        ),

      ],
    );
  }

   Widget _getFetureBrandSaleTitle()
   {
     return  Padding(
       padding:EdgeInsets.only(left: 24,right: 24,top: 24),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Text("Featured  Breands ",style: GoogleFonts.pTSerifCaption(
             textStyle: TextStyle(color: Colors.black, fontSize: 14),)),
         ],

       ),
     );
   }

   Widget _getFetureBrandSaleBanner()
   {
     return  Column(
       children: <Widget>[
         Padding(
           padding:EdgeInsets.only(top: 16),
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: 192,
             color: Colors.blue,
             child: Center(
               child: Text("Brand Banner",style: TextStyle(color: Colors.black,fontSize: 16),),
             ),
           )
         )
       ],
     );
   }

   Widget _getNewArrivalBrandSaleTitle()
   {
     return  Padding(
       padding:EdgeInsets.only(left: 24,right: 24,top: 24),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Text("New Arrival ",style: GoogleFonts.pTSerifCaption(
             textStyle: TextStyle(color: Colors.black, fontSize: 14),)),
         ],

       ),
     );
   }

   Widget _getNewArrivalBrandSaleBanner()
   {
     return  Column(
       children: <Widget>[
         Padding(
             padding:EdgeInsets.only(top: 16),
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: 192,
               color: Colors.orange,
               child: Center(
                 child: Text("New Arrival Item",style: TextStyle(color: Colors.black,fontSize: 16),),
               ),
             )
         )
       ],
     );
   }

   Widget _getNewArrivalNewArrivalItem(ManScreenBlock block)
   {
     return  StreamBuilder(
       stream: block.listBlockStream,
       builder: (context,snapdata){
         return Container(
           padding: EdgeInsets.only(left: 8),
           height: 200,
           width: double.infinity,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount:snapdata.hasData?snapdata.data:0,
             itemBuilder: (BuildContext ctx, int index) {
               return ProductItem();
             },
           ),
         );
       },
     );
   }

   Widget _getPedoraSaleTitle()
   {
     return  Padding(
       padding:EdgeInsets.only(left: 24,right: 24,top: 12),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Text("Pedora Sale ",style: GoogleFonts.pTSerifCaption(
             textStyle: TextStyle(color: Colors.black, fontSize: 14),)),
         ],

       ),
     );
   }

   Widget _getPedoraSaleBanner()
   {
     return  Column(
       children: <Widget>[
         Padding(
             padding:EdgeInsets.only(top: 16),
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: 192,
               color: Colors.blue,
               child: Center(
                 child: Text("Pedora Sale",style: TextStyle(color: Colors.black,fontSize: 16),),
               ),
             )
         )
       ],
     );
   }

}
