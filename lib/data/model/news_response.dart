import 'package:api_practice/data/model/news.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  num totalResult;

  List<News> articles;

  static NewsResponse fromJsonMap(Map<String, dynamic> json) {
    return _$NewsResponseFromJson(json);
  }
}
