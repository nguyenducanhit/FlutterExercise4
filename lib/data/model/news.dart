import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;

  static News fromJson(Map<String, dynamic> json) {
    return _$NewsFromJson(json);
  }
}
