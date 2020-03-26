import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class App {
    App();

    bool selected;
    String appId;
    String appName;
    String version;
    String platform;
    String channel;
    String downloadUrl;
    String createTime;
    String updateTime;
    
    factory App.fromJson(Map<String,dynamic> json) => _$PersonFromJson(json);
    Map<String, dynamic> toJson() => _$PersonToJson(this);
}
