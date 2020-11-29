import 'package:flutter/material.dart';
import 'package:flutter_planet/style.dart';
import 'detail_page.dart';
import 'model/planet.dart';

//각각의 card를 만드는 클래스
class PlanetSummary extends StatelessWidget {
  final Planet planet;

  PlanetSummary(this.planet);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      alignment: Alignment.centerLeft, //사이즈는 현재 부모컨테이너와 동일
      child: Hero(
        tag: "planet-hero-${planet.id}",
        child: Image(
          image: AssetImage(planet.image),
          height: 90.0,
          width: 90.0,
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      //distance와 gravity
      return Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(image, height: 12.0),
            Container(width: 8.0),
            Text(value, style: regularTextStyle()),
          ],
        ),
      );
    }

    //카드 내용
    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0), //카드 안의 여백 지정
      constraints: BoxConstraints.expand(), //크기에 제약조건 주는 것
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(planet.name, style: headerTextStyle()),
          Container(height: 10.0),
          Text(planet.location, style: subHeaderTextStyle()),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              //horizontal(left, right), vertical (top, bottom)의 padding 값을 적용
              width: 18.0,
              height: 2.0,
              color: Color(0xff00c6ff)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/img/ic_distance.png')),
              Container(
                width: 32.0,
              ),
              Expanded(
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    //카드의 겉모양
    final planetCard = Container(
      child: planetCardContent,
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0), //왼쪽만 margin을 줘서 썸네일자리 확보
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle, //컨테이너를 네모모양으로 만들어줌
        borderRadius: BorderRadius.circular(8.0), //모서리 약간 둥글게
        boxShadow: <BoxShadow>[
          //그림자 따로 설정 가능
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0, //자연스럽게 퍼지게
            offset: Offset(0.0, 10.0), //x축, y축 그림자 정도 지정
          ),
        ],
      ),
    );

    return GestureDetector(
        onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                // PageRouteBuilder는 animation 객체를 제공해줘서 페이지 시작에 애니메이션을 사용 할 수 있게 해줌,  2개의 콜백
                pageBuilder: (_, __, ___) => DetailPage(planet),
                //route에 콘텐츠를 빌드하기 위해 사용
                // (_, __, ___) 받아올 인자값이 있지만 사용하지 않을때
                transitionsBuilder: //route의 전환을 빌드하기 위해 사용
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                transitionDuration: Duration(milliseconds: 500),
              ),
            ),
        child: Container(
          //전체 컨테이너 안에 card 컨테이너와 썸네일 컨테이너 stack
          margin: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ));
  }
}
