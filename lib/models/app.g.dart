// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$PersonFromJson(Map<String, dynamic> json) {
  return App()
    ..selected = json['selected'] as bool
    ..appId = json['appId'] as int
    ..appName = json['appName'] as String
    ..version = json['version'] as String
    ..platform = json['platform'] as String
    ..channel = json['channel'] as String
    ..clientId = json['clientId'] as num
    ..downloadUrl = json['downloadUrl'] as String
    ..token = json['token'] as String
    ..updateLog = json['updateLog'] as String
    ..createTime = json['createTime'] as num
    ..updateTime = json['updateTime'] as num;
}

Map<String, dynamic> _$PersonToJson(App instance) => <String, dynamic>{
      'selected': instance.selected,
      'appId': instance.appId,
      'appName': instance.appName,
      'version': instance.version,
      'platform': instance.platform,
      'channel': instance.channel,
      'clientId': instance.clientId,
      'downloadUrl': instance.downloadUrl,
      'token': instance.token,
      'updateLog': instance.updateLog,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime
    };
