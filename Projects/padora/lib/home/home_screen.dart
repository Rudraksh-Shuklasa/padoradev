import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padora/home/screens/man/man_screen.dart';
import 'package:padora/utils/constants/image_constansts.dart';

import 'block/HomeBlock.dart';



class HomeScreen extends StatefulWidget {





  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final bloc = HomeBlock();
  TabController _tabController;
  int _current = 0;



  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "PADORA",
              style: GoogleFonts.pTSerifCaption(
                textStyle: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          bottom:  TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,

            tabs: [
              new Tab(
                child: Text("MALE",style: TextStyle(color: Colors.black),
                ),
              ),
              new Tab(
                child: Text("FEMALE",style: TextStyle(color: Colors.black)),
              ),
            ],
            controller: _tabController,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0),
                insets: EdgeInsets.symmetric(horizontal:8.0)
            ),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Image.asset(
                    IC_SERACH,
                    scale: 4,
                  ),
                  onPressed: () => {},
                ),
                IconButton(
                    icon: Image.asset(
                      IC_CART,
                      scale: 4,
                    ),
                    onPressed: () {
                      print('Click start');
                    }),
              ],
            )
          ],
        ),
        body: TabBarView(
                children: [
                   ManScreen(),
                   Text("This is chat Tab View"),
                ],
                controller: _tabController,
              )
    );

  }
}
