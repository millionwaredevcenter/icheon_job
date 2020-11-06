class JsonRes {
  final dynamic response;
  JsonRes({this.response});
  factory JsonRes.fromJSON(Map<String,dynamic> json) {
    return JsonRes(
        response: json["EmplmntInfoStus"]
    );
  }
}