import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_wan_android/data/ArticleTree.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_wan_android/tree/KnowledgeListPage.dart';
import 'package:flutter_wan_android/widget/LoadingWidget.dart';

class KnowledgeTreePage extends StatefulWidget {
  @override
  _KnowledgeTreePageState createState() => _KnowledgeTreePageState();
}

class _KnowledgeTreePageState extends State<KnowledgeTreePage> with AutomaticKeepAliveClientMixin{
  //获取体系数据
  List<ArticleTreeData> _mData;
  ScrollController _controller = ScrollController(keepScrollOffset: true);

  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  Future<List<ArticleTreeData>> getTree() async {
    if (_mData != null && _mData.length > 0) {
      return _mData;
    }
    Response res = await Dio().get("https://wanandroid.com/tree/json");
    if (res.statusCode == 200) {
      //res.data 是 map
      ArticleTree articleTree = ArticleTree.fromJsonMap(res.data);
      return articleTree.data;
    } else {
      throw "error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTree(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        }
        _mData = snapshot.data;
        print("${_mData.length}");
        return ListView.separated(
          controller: _controller,
          itemBuilder: _itemBuilder,
          itemCount: _mData.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    ArticleTreeData article = _mData[index];
    return new GestureDetector(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    article.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(),
                  Text(_getSubtitleContent(article.children)),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(), //没有这个会导致空白的地方不能点击...
      ),
      onTap: () {
        _itemClick(article);
      },
    );

//      ListTile(
//      title: Text(article.name),
//      subtitle: Text(
//        _getSubtitleContent(article.children),
//      ),
//      trailing: Icon(Icons.keyboard_arrow_right),
//      onTap: () {
//        _itemClick(article);
//      },
//    );
  }

  void _itemClick(ArticleTreeData article) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => KnowledgeListPage(article)));
  }

  String _getSubtitleContent(List<Children> children) {
    StringBuffer stringBuffer = StringBuffer("");
    children.forEach((it) {
      stringBuffer.write(it.name + "      ");
    });
    return stringBuffer.toString();
  }

  @override
  bool get wantKeepAlive => true;
}
