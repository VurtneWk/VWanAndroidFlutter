import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/ArticleList.dart';
import 'package:flutter_wan_android/data/ArticleTree.dart';
import 'package:flutter_wan_android/utils/HttpUtils.dart';
import 'package:flutter_wan_android/widget/LoadingWidget.dart';

/// 知识列表页
class KnowledgeListPage extends StatefulWidget {
  final ArticleTreeData article;

  KnowledgeListPage(this.article);

  @override
  _KnowledgeListPageState createState() => _KnowledgeListPageState(article);
}

class _KnowledgeListPageState extends State<KnowledgeListPage>
    with SingleTickerProviderStateMixin {
  final ArticleTreeData article;

  _KnowledgeListPageState(this.article);

  //控制/监听Tab菜单切换。
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: article.children.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.name),
        bottom: TabBar(
          tabs: _tabs(),
          isScrollable: true,
          controller: _tabController,
        ),
      ),
      body: TabBarView(controller: _tabController, children: _tabBarView()),
    );
  }

  List<Widget> _tabBarView() {
    return article.children.map((it) => ArticleListPage(it.id)).toList();
  }

  List<Widget> _tabs() {
    return article.children.map((it) => Tab(text: it.name)).toList();
  }
}

//具体的列表
class ArticleListPage extends StatefulWidget{
  final int _cid;

  ArticleListPage(this._cid);


  @override
  _ArticleListPageState createState() => _ArticleListPageState(_cid);
}

class _ArticleListPageState extends State<ArticleListPage>  with AutomaticKeepAliveClientMixin {
  final int _cid;
  int pageNum = 0;

  _ArticleListPageState(this._cid);

  List<Article> _data = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Article>> getArticleData() async {
    Response res = await HttpUtils.instance
        .getDio()
        .get("/article/list/$pageNum/json?cid=$_cid");
    _data = ArticleList.fromJsonMap(res.data).data.datas;
    print(_data);
    return _data;
  }

  Future<List<Article>> onRefresh() async {
    pageNum = 0;
    Response res = await HttpUtils.instance
        .getDio()
        .get("/article/list/$pageNum/json?cid=$_cid");
    setState(() {
      _data.clear();
      _data.addAll(ArticleList.fromJsonMap(res.data).data.datas);
    });
    return _data;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Text("$index ${_data[index].title}");
            },
            separatorBuilder: (bContext, int) {
              return Divider();
            },
            itemCount: _data.length),
        onRefresh: () => onRefresh());
  }

  @override
  bool get wantKeepAlive => true;
}
