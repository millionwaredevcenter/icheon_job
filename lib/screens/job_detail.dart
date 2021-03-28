import 'package:flutter/material.dart';
import 'package:icheon_job/models/emp_job.dart';
import 'package:icheon_job/screens/job_unit.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetail extends StatelessWidget {
  final EmpJob job;

  const JobDetail({Key key, @required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${job.companyNm}"),
        actions: [
          RaisedButton(
              child: Icon(Icons.add_to_home_screen),
              color: Colors.lime,
              onPressed: () async {
                var url = job.emplmntInfoUrl;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JobUnit(
                title: "등록일자",
                content: job.registDe,
              ),
              JobUnit(
                title: "구인인증번호",
                content: job.joboffrCertfiyNo,
              ),
              JobUnit(
                title: "회사명",
                content: job.companyNm,
              ),
              JobUnit(
                title: "사업자등록번호",
                content: job.bizRegNo == null ? '미입력' : job.bizRegNo,
              ),
              JobUnit(
                title: "채용공고명",
                content: job.emplmntTitle,
              ),
              JobUnit(
                title: "임금형태",
                content: job.wageForm,
              ),
              JobUnit(
                title: "급여",
                content: job.salaryInfo,
              ),
              JobUnit(
                title: "최소임금액",
                content: job.minWageInfo,
              ),
              JobUnit(
                title: "최대임금액",
                content: job.maxWageInfo,
              ),
              JobUnit(
                title: "근무지역",
                content: job.workRegionLoc,
              ),
              JobUnit(
                title: "근무형태",
                content: job.workForm == null ? '미입력' : job.workForm,
              ),
              JobUnit(
                title: "최소학력",
                content: job.minAcdmcr == null ? '미입력' : job.minAcdmcr,
              ),
              JobUnit(
                title: "최대학력",
                content: job.maxAcdmcr == null ? '미입력' : job.maxAcdmcr,
              ),
              JobUnit(
                title: "경력",
                content: job.careerInfo,
              ),
              JobUnit(
                title: "마감일자",
                content: job.closDeInfo,
              ),
              JobUnit(
                title: "정보제공출처명",
                content: job.infoProvsnOrifinDivNm,
              ),
              JobUnit(
                title: "근무지 우편주소",
                content: job.workplcBasisAddr,
              ),
              JobUnit(
                title: "고용형태코드",
                content: job.emplymtFormCd,
              ),
              JobUnit(
                title: "고용형태",
                content: job.emplymtForm,
              ),
              JobUnit(
                title: "최종수정일자",
                content: job.lastUpdDeInfo,
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
