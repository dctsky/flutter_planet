import 'package:flutter/material.dart';
import 'package:flutter_planet/model/planet.dart';
import 'package:flutter_planet/planet_summary.dart';
import 'package:flutter_planet/style.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(planet),
            _getGradient(),
            _getContent(planet),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  _getBackground(Planet planet) {
    return Container(
      child: Image.asset(
        planet.backgroundImg,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 300.0),
    );
  }

  _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //라인 색상을 전환할 때 사용
          colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
          stops: [0.0, 0.9], //시작과 끝을 설정
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  _getContent(Planet planet) {
    final _overviewTitle = "Overview".toUpperCase();
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 32.0),
      children: <Widget>[
        PlanetSummary(planet),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _overviewTitle,
                style: headerTextStyle(),
              ),
              Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: 2.0,
                  width: 30.0,
                  color: Color(0xff00c6ff)),
              Text(
                planet.description,
                style: descriptionTextStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }
}
