import 'package:api_practice/data/model/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(children: [
        Image.network(
          news.urlToImage,
          width: 100,
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Column(
                children: [
                  Align(
                    child: Text(
                      news.title,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Text(
                      news.title,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              )),
        )
      ]),
    );
  }
}
