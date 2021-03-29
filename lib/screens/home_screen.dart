import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:icheon_job/consttants.dart';
import 'package:icheon_job/models/emp_job.dart';
import 'package:icheon_job/models/json_res.dart';
import 'package:icheon_job/screens/details_screen.dart';
import 'package:icheon_job/screens/job_card.dart';
import 'package:icheon_job/widgets/book_rating.dart';
import 'package:icheon_job/widgets/reading_card_list.dart';
import 'package:icheon_job/widgets/two_side_rounded_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EmpJob> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var url =
        "${DotEnv().env['DATAGG_API_URL']}/EmplmntInfoStus?KEY=${DotEnv().env['DATAGG_API_KEY']}&type=json&SIGUN_CD=41500";

    print("[url is] $url");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var wdata = JsonRes.fromJSON(json);
    var items = wdata.response[1]["row"];

    List<EmpJob> inlist = [];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      inlist.add(EmpJob.formJson(item));
    }
    print("getData call ${items[1].length}");
    setState(() {
      list = inlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/main_page_bg.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.display1,
                        children: [
                          TextSpan(text: "Find your job today\n"),
                          TextSpan(
                              text: "in Icheon",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: size.height * .31,
                      width: size.width * .95,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemExtent: 230.0,
                          itemCount: list.length == null ? 0 : list.length,
                          itemBuilder: (context, index) {
                            EmpJob card = list[index];
                            var title = card.emplmntTitle;
                            var company = card.companyNm;
                            var salary = card.salaryInfo;

                            return ReadingListCard(
                              image: "assets/images/book-1.png",
                              title: company,
                              auth: title,
                              rating: salary,
                              pressDetails: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailsScreen();
                                    },
                                  ),
                                );
                              },
                            );
                          }
                          //JobCard(context, list[index], index)
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.display1,
                            children: [
                              TextSpan(text: "Best of the "),
                              TextSpan(
                                text: "day",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        bestOfTheDayCard(size, context),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.display1,
                            children: [
                              TextSpan(text: "Continue "),
                              TextSpan(
                                text: "reading...",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(38.5),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 33,
                                color: Color(0xFFD3D3D3).withOpacity(.84),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(38.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Crushing & Influence",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Gary Venchuk",
                                                style: TextStyle(
                                                  color: kLightBlackColor,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(
                                                  "Chapter 7 of 10",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: kLightBlackColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/images/book-1.png",
                                          width: 55,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 7,
                                  width: size.width * .65,
                                  decoration: BoxDecoration(
                                    color: kProgressIndicator,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container bestOfTheDayCard(Size size, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    width: double.infinity,
    height: 245,
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              left: 24,
              top: 24,
              right: size.width * .35,
            ),
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEAEAEA).withOpacity(.45),
              borderRadius: BorderRadius.circular(29),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "New York Time Best For 11th March 2020",
                    style: TextStyle(
                      fontSize: 9,
                      color: kLightBlackColor,
                    ),
                  ),
                ),
                Text(
                  "How To Win \nFriends &  Influence",
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  "Gary Venchuk",
                  style: TextStyle(color: kLightBlackColor),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: BookRating(score: "4.9"),
                      ),
                      Expanded(
                        child: Text(
                          "When the earth was flat and everyone wanted to win the game of the best and people….",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: kLightBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            "assets/images/book-3.png",
            width: size.width * .37,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 40,
            width: size.width * .3,
            child: TwoSideRoundedButton(
              text: "Read",
              radious: 24,
              press: () {},
            ),
          ),
        ),
      ],
    ),
  );
}
