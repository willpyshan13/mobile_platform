import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class App {
    App();

    bool selected;
    int appId;
    String appName;
    String version;
    String platform;
    num clientId;
    String channel;
    String downloadUrl;
    String updateLog;
    num createTime;
    num updateTime;
    
    factory App.fromJson(Map<String,dynamic> json) => _$PersonFromJson(json);
    Map<String, dynamic> toJson() => _$PersonToJson(this);
}
