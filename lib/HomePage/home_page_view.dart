import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tedx_app/HomePage/home_page_viewmodel.dart';
import 'package:tedx_app/SpeakersPage/speakers_page.dart';
import 'package:tedx_app/PartnersPage/partners_page.dart';
import 'package:tedx_app/shared_widgets/fab_menu.dart';

class HomePageView extends HomePageViewModel with TickerProviderStateMixin {
  AnimationController _controllerFirst;
  Animation<Offset> _offsetFirst;

  AnimationController _controllerSecond;
  Animation<Offset> _offsetSecond;

  AnimationController _controllerThird;
  Animation<Offset> _offsetThird;

  @override
  void initState() {
    super.initState();

    initFirstAnimator();
    initSecondAnimator();
    initThirdAnimator();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final int _primaryColor = 0xffff0000;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.hue),
            child: Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/tedx.jpg'), fit: BoxFit.fill)),
            ),
          ),
          SlideTransition(
            position: _offsetFirst,
            child: Container(
              margin: EdgeInsets.only(top: 150.0, left: 20.0),
              child: Text(
                'IDEAS',
                style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SlideTransition(
            position: _offsetSecond,
            child: Container(
              margin: EdgeInsets.only(top: 250.0, left: 20.0),
              child: Text(
                'WORTH',
                style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SlideTransition(
            position: _offsetThird,
            child: Container(
              margin: EdgeInsets.only(top: 350.0, left: 20.0),
              child: Text(
                'SPREADING',
                style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: FabMenu()
                      .setLocation(MenuLocation.BottomRight)
                      .addCenterFab(Icons.menu)
                      .addActionFab(Icons.info,
                          color: _primaryColor, heroTag: 'team', onPressed: () {
                print('Clicked info icon');
              }).addActionFab(Icons.verified_user,
                          color: _primaryColor,
                          heroTag: 'partners', onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PartnersPage()));
              }).addActionFab(Icons.people,
                          color: _primaryColor,
                          heroTag: 'speakers', onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SpeakersPage()));
              }))
            ],
          )
        ],
      ),
    );
  }

  void initFirstAnimator() {
    _controllerFirst = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _offsetFirst = Tween<Offset>(begin: Offset(-2.0, 0.0), end: Offset.zero)
        .animate(_controllerFirst);

    _offsetFirst.addListener(() {
      setState(() {});
    });

    _controllerFirst.forward();
  }

  void initSecondAnimator() {
    _controllerSecond = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _offsetSecond = Tween<Offset>(begin: Offset(-2.0, 0.0), end: Offset.zero)
        .animate(_controllerSecond);

    _offsetSecond.addListener(() {
      setState(() {});
    });
    _controllerSecond.forward();
  }

  void initThirdAnimator() {
    _controllerThird = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _offsetThird = Tween<Offset>(begin: Offset(-2.0, 0.0), end: Offset.zero)
        .animate(_controllerThird);

    _offsetThird.addListener(() {
      setState(() {});
    });
    _controllerThird.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerFirst.dispose();
  }
}
