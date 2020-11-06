class EmpJob {
  String registDe;
  String sigunCd;
  String sigunNm;
  String joboffrCertfiyNo;
  String companyNm;
  String bizRegNo;
  String emplmntTitle;
  String wageForm;
  String salaryInfo;
  String minWageInfo;
  String maxWageInfo;
  String workRegionLoc;
  String workForm;
  String minAcdmcr;
  String maxAcdmcr;
  String careerInfo;
  String closDeInfo;
  String infoPorvsnOriginNm;
  String infoProvsnOrifinDivNm;
  String emplmntInfoUrl;
  String workplcZipCd;
  String workplcRoadnmAddr;
  String workplcBasisAddr;
  String workplcDetailAddr;
  String emplymtFormCd;
  String emplymtForm;
  String jobclassDivCd;
  String jobClassDivNm;
  String lastUpdDeInfo;

  EmpJob.formJson(Map<String, dynamic> json)
      : registDe = json["REGIST_DE"],
        sigunCd = json["SIGUN_CD"],
        sigunNm = json["SIGUN_NM"],
        joboffrCertfiyNo = json["JOBOFFR_CERTFIY_NO"],
        companyNm = json["COMPNY_NM"],
        bizRegNo = json["BIZ_REG_NO"],
        emplmntTitle = json["EMPLMNT_TITLE"],
        wageForm = json["WAGE_FORM"],
        salaryInfo = json["SALARY_INFO"],
        minWageInfo = json["MIN_WAGE_INFO"],
        maxWageInfo = json["MAX_WAGE_INFO"],
        workRegionLoc = json["WORK_REGION_LOC"],
        minAcdmcr = json["MIN_ACDMCR"],
        maxAcdmcr = json["MAX_ACDMCR"],
        careerInfo = json["CAREER_INFO"],
        closDeInfo = json["CLOS_DE_INFO"],
        infoPorvsnOriginNm = json["INFO_PROVSN_ORIGIN_NM"],
        infoProvsnOrifinDivNm = json["INFO_PROVSN_ORIGIN_DIV_NM"],
        emplmntInfoUrl = json["EMPLMNT_INFO_URL"],
        workplcZipCd = json["WORKPLC_ZIP_CD"],
        workplcRoadnmAddr = json["WORKPLC_ROADNM_ADDR"],
        workplcBasisAddr = json["WORKPLC_BASIS_ADDR"],
        workplcDetailAddr = json["WORKPLC_DETAIL_ADDR"],
        emplymtFormCd = json["EMPLYMT_FORM_CD"],
        emplymtForm = json["EMPLYMT_FORM"],
        jobclassDivCd = json["JOBCLASS_DIV_CD"],
        jobClassDivNm = json["JOBCLASS_DIV_NM"],
        lastUpdDeInfo = json["LAST_UPD_DE_INFO"];
}
