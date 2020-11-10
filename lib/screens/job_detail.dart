import 'package:flutter/material.dart';
import 'package:icheon_job/models/emp_job.dart';

class JobDetail extends StatelessWidget {
  final EmpJob job;

  const JobDetail({Key key, @required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${job.companyNm}")),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("등록일자 : ${job.registDe}"),
            Text("구인인증번호 : ${job.joboffrCertfiyNo}"),
            Text("회사명 : ${job.companyNm}"),
            Text("사업자등록번호 : ${job.bizRegNo == null ? '미입력' : job.bizRegNo}"),
            Text("채용공고명 : ${job.emplmntTitle}"),
            Text("임금형태 : ${job.wageForm}"),
            Text("급여 : ${job.salaryInfo}"),
            Text("최소임금액 : ${job.minWageInfo}"),
            Text("최대임금액 : ${job.maxWageInfo}"),
            Text("근무지역 : ${job.workRegionLoc}"),
            Text("근무형태 : ${job.workForm == null ? '미입력' : job.workForm}"),
            Text("최소학력 : ${job.minAcdmcr == null ? '미입력' : job.minAcdmcr}"),
            Text("최대학력 : ${job.maxAcdmcr == null ? '미입력' : job.maxAcdmcr}"),
            Text("경력 : ${job.careerInfo}"),
            Text("마감일자 : ${job.closDeInfo}"),
            Text("정보제공출처명 : ${job.infoProvsnOrifinDivNm}"),
            Text("워크넷 채용정보 URL : ${job.emplmntInfoUrl}"),
            Text("근무지 우편주소 : ${job.workplcZipCd}"),
            Text("근무지 기본주소 : ${job.workplcBasisAddr}"),
            Text("고용형태코드 : ${job.emplymtFormCd}"),
            Text("고용형태 : ${job.emplymtForm}"),
            Text("직종코드 : ${job.jobclassDivCd}"),
            Text("직종명 : ${job.jobClassDivNm}"),
            Text("최종수정일자 : ${job.lastUpdDeInfo}"),
          ],
        ),
      ),
    );
  }
}
