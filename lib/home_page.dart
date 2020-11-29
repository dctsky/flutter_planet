import 'package:flutter/material.dart';
import 'package:flutter_planet/planet_summary.dart';

import 'model/planet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Color(0xFF736AB7),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverAppBar(
                    backgroundColor: Colors.indigo[600],
                    expandedHeight: 200,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text('Planet',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                            )),
                        background: Image.asset(
                          // AppBar에 배경으로 이미지 지정 가능
                          'assets/img/solar_system.jpg',
                          fit: BoxFit.cover,
                        ))),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  sliver: SliverFixedExtentList(
                    //높이가 고정된 리스트를 보여주기위해 SliverFixedExtentList 을 사용
                    itemExtent: 152.0,
                    //itemExtent 는 행의 크기를 설정하는 속성이고 크기가 모두 같으면 그리는 속도가 빨라진다.
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => PlanetSummary(planets[index]),
                      childCount: planets.length,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
