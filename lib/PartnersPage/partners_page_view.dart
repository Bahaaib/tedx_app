import 'package:flutter/material.dart';
import 'package:tedx_app/PartnersPage/partners_page_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tedx_app/text_utils.dart';

class PartnersPageView extends PartnersPageViewModel {
  int _currentPage = 0;
  List colorList = [
    0xff6ec1e4,
    0xffFFFF99,
    0xff00FF00,
    0xff00FF00,
    0xff00FF00,
    0xff00FF00
  ];
  final int _primaryColor = 0xff6ec1e4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Our Partners',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
          ),
          CarouselSlider(
              height: 300.0,
              initialPage: 0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              items: colorList.map((color) {
                return Builder(builder: (BuildContext context) {
                  return _buildListItems(context, _currentPage, 400.0);
                });
              }).toList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _map<Widget>(colorList, (index, color) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Color(_primaryColor)
                      : Colors.grey,
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget _buildListItems(BuildContext context, int position, double width) {
    return Center(
        child: Container(
      width: 200.0,
      margin: EdgeInsets.only(bottom: 13.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 15.0, spreadRadius: -5.0)
      ]),
      child: Image.asset(TextUtils.partnersLogos[position]),
    ));
  }
}
