import 'package:flutter/material.dart';
import 'package:icheon_job/size_config.dart';

class MwIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("앱 소개"),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                          width: MediaQuery.of(context).size.width,
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
                            subtitle: Text(
                                "이천을 대표하는 IT 기업입니다\nIT 기술을 기반으로 이천에 터를 잡고 성장하고 있습니다.\n우리가 가진 기술을 이천의 발전을 위해 나누겠습니다."),
                          ),
                          ListTile(
                            subtitle: Text(
                                "사업영역\nBig Data Visualization\nSilicon Wafer Map Product\nScientific Chart Product\nPrivate Cloud Platform"),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            subtitle: Text(
                                "홈페이지 : https://www.millionware.io\n연락처 : 031.633.0055\n주소 : 경기도 이천시 부발읍 경충대로2092번길 39-19 하이클래스 3층 301호"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
