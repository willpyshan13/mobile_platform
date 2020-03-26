import 'package:json_annotation/json_annotation.dart';
import "orderItem.dart";
part 'page.g.dart';

@JsonSerializable()
class Page {
    Page();

    int totalCount=0;
    int pageSize=10;
    int currPage=1;
    int totalPage=1;
    List<OrderItem> orders = [];
    List<Map> list;
    
    factory Page.fromJson(Map<String,dynamic> json) => _$PageFromJson(json);
    Map<String, dynamic> toJson() => _$PageToJson(this);
}
