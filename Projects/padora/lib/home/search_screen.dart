import 'package:flutter/material.dart';
import 'package:padora/utils/navigation.dart';
import 'package:padora/widget/search_item.dart';

import 'block/HomeBlock.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _editingController = TextEditingController();
  final bloc = HomeBlock();

  @override
  void initState() {
    super.initState();
    bloc.listSearchItemSink(0);
    _editingController.addListener(() {
      if (!_editingController.text.isEmpty)
        bloc.listSearchItemSink(30);
      else
        bloc.listSearchItemSink(0);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () => {NavigationUtils.pop(context)},
              child: Hero(
                  tag: "search",
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 24,
                  ))),
          title: TextFormField(
            controller: _editingController,
            decoration: InputDecoration(
                hintText: "Serach..",
                hintStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Colors.black),
            style: TextStyle(color: Colors.black, fontSize: 16),
            onChanged: updateSearch,
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
          ),
          actions: <Widget>[
            Icon(
              Icons.search,
              color: Colors.black,
              size: 24,
            )
          ],
        ),
        body: StreamBuilder(
            stream: bloc.listSearchItemStream,
            builder: (context, snapData) {
              return snapData.hasData
                  ? snapData.data == 0
                      ? Container(
                          child: Center(
                            child: Text("No data"),
                          ),
                        )
                      : Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapData.data,
                              itemBuilder: (BuildContext ctx, int index) {
                                return SearchItem();
                              },
                            ),
                          ),
                        )
                  : Container(
                      child: Center(
                        child: Text("No data"),
                      ),
                    );
            }));
  }

  void updateSearch(String value) {}
}
