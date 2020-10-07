import 'dart:async';

import 'package:api_practice/data/model/news_response.dart';
import 'package:api_practice/data/remote/api_const.dart';
import 'package:api_practice/data/remote/network.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  Network _network;
  StreamController streamController;

  NewsRepository() {
    _network = Network();
    streamController = StreamController.broadcast();
  }

  Future close() async {
    await streamController.close();
  }

  Future<void> searchNews(String keyword) async {
    Response response =
        await _network.get(url: ApiConst.API_SEARCH, params: {"q": keyword});
    streamController.add(NewsResponse.fromJsonMap(response.data));
  }
}
