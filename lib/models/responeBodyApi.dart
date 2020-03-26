import 'package:json_annotation/json_annotation.dart';
part 'responeBodyApi.g.dart';

@JsonSerializable()
class ResponseBodyApi<T> {
    ResponseBodyApi();

    bool success;
    int code;
    String message;
    T data;
    
    factory ResponseBodyApi.fromJson(Map<String,dynamic> json) => _$ResponseBodyApiFromJson(json);
    Map<String, dynamic> toJson() => _$ResponseBodyApiToJson(this);
}
