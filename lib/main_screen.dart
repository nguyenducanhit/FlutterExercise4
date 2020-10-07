import 'package:api_practice/data/repository/news_repository.dart';
import 'package:api_practice/news_list.dart';
import 'package:api_practice/widget/search_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  NewsRepository newsRepository;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    newsRepository = NewsRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        title: "Lọc tin tức",
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              child: Text("Tin tức"),
            ),
            Tab(
              child: Text("Đã lưu"),
            ),
            Tab(
              child: Text("Yêu thích"),
            ),
          ],
        ),
        onActionPress: (keyWord) {
          newsRepository.searchNews(keyWord);
        },
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          NewsList(newsRepository),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
