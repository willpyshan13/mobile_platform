// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page()
    ..totalCount = json['totalCount'] as int
    ..pageSize = json['pageSize'] as int
    ..currPage = json['currPage'] as int
    ..totalPage = json['totalPage'] as int
    ..list = (json['list'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList();
}

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'pageSize': instance.pageSize,
      'currPage': instance.currPage,
      'totalPage': instance.totalPage,
      'list': instance.list
    };
