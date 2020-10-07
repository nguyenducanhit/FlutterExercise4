import 'package:api_practice/data/model/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatefulWidget {
  News news;

  NewsItem(this.news);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NewsItemState(news);
  }
}

class _NewsItemState extends State<NewsItem> {
  News news;

  _NewsItemState(this.news);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children: [
      Image.network(news.urlToImage),
      Column(
        children: [
          Text(
            news.title,
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            news.title,
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    ]);
  }
}
