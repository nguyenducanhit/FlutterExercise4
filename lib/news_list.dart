import 'package:api_practice/data/model/news.dart';
import 'package:api_practice/data/repository/news_repository.dart';
import 'package:api_practice/item_news.dart';
import 'package:flutter/cupertino.dart';

import 'data/model/news_response.dart';

class NewsList extends StatefulWidget {
  NewsRepository newsRepository;

  NewsList(this.newsRepository);

  @override
  State<StatefulWidget> createState() {
    return _NewListState(newsRepository);
  }
}

class _NewListState extends State<NewsList> {
  NewsRepository newsRepository;


  _NewListState(this.newsRepository);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text("Không có bài viết nào"),
            );
          }
          return new ListView.builder(
            itemBuilder: (context, index) {
              return new NewsItem((snapshot.data as NewsResponse).articles[index]);
            },
            itemCount: (snapshot.data as NewsResponse).articles.length,
          );
        },
        stream: newsRepository.streamController.stream);
  }
}
