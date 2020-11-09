import 'package:flutter/material.dart';
import 'package:icheon_job/size_config.dart';

class MwIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("앱소개"),
      ),
      body: Container(
        child: Stack(
          children: [
            Card(
              child: Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/lake-tekapo.jpg",
                        height: getProportionateScreenWidth(300),
                        fit: BoxFit.cover,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getProportionateScreenWidth(70),
                          ),
                          Text("Millionware",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(58),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Text(
                            "- 이천을 대표하는 IT기업, 밀리언웨어 입니다. -",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.info),
                          title: Text("이천 일자리"),
                          subtitle: Text("경기도데이터드림이 제공하는 API를 이용한 앱입니다."),
                        ),
                        ListTile(
                          subtitle: Text(
                              "고용노동부 한국고용정보원에서 운영하는 워크넷(www.work.go.kr)에 등록된 경기도 내 민간 채용공고 정보를 제공합니다."),
                        ),
                        ListTile(
                          subtitle:
                              Text("※ OpenApi 정보 제공에 동의한 기업의 채용 정보만을 제공합니다."),
                        ),
                        ListTile(
                          leading: Icon(Icons.airport_shuttle),
                          title: Text("밀리언웨어"),
                          subtitle: Text("이천에 대표하는 IT 기업입니다!"),
                        ),
                        ListTile(
                          subtitle: Text(
                              "Big Data Visualization\nSilicon Wafer Map Product\nScientific Chart Product\nPrivate Cloud Platform"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
