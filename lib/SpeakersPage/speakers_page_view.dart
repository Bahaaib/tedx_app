import 'package:flutter/material.dart';
import 'package:tedx_app/SpeakersPage/speakers_page_viewmodel.dart';

class SpeakersPageView extends SpeakersPageViewModel {
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      double _width = MediaQuery.of(context).size.width;

      return data == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data['speakers']['data'].length,
              itemBuilder: (BuildContext context, int position) =>
                  _buildListItems(context, position, _width));
    }));
  }

  Widget _buildListItems(BuildContext context, int position, double width) {
    // if (position == 0) {
    //   return Center(
    //     child: Padding(
    //       padding:
    //           EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0, bottom: 20.0),
    //       child: Text(
    //         'Our Speakers',
    //         textAlign: TextAlign.center,
    //         style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //   );
    // }
    return Center(
        child: Container(
            margin:
                EdgeInsets.only(top: 10.0, bottom: position == 9 ? 70.0 : 20.0),
            width: width < 400.0 ? 340.0 : 380.0,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Stack(children: <Widget>[
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      image: DecorationImage(
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.multiply),
                          image: NetworkImage(
                              'https://seasonsapp.co/ted/public/speaker/${data['speakers']['data'][position]['image']}'),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 90.0),
                    child: Text(
                      data['speakers']['data'][position]['name'],
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 200.0),
                  child: ExpansionTile(
                    title: Text('Details'),
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 12.0, right: 20.0, bottom: 10.0),
                          child: Text(
                            data['speakers']['data'][position]['description'],
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                )
              ]),
            )));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
}
