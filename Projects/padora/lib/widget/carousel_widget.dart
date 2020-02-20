import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final Widget placeholder = Container(color: Colors.grey);

class CarouselWidget extends StatefulWidget {
  List imageList;
  CarouselWidget(this.imageList);
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
  @override
  void initState() {


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        viewportFraction: 1.0,
        aspectRatio: 2.0,
        autoPlay: false,
        enlargeCenterPage: false,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
        items: map<Widget>(
          widget.imageList,
              (index, i) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(i), fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          widget.imageList,
              (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}
