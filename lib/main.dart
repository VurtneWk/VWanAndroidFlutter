import 'package:flutter/material.dart';
import 'package:flutter_wan_android/home/HomePage.dart';
import 'package:flutter_wan_android/navigation/NavigationPage.dart';
import 'package:flutter_wan_android/project/ProjectPage.dart';
import 'package:flutter_wan_android/tree/KnowledgeTreePage.dart';
import 'package:flutter_wan_android/utils/Utils.dart';
import 'package:flutter_wan_android/wechat/WeChatPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowCheckedModeBanner: false,
      title: 'Wan Android',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wanAndroid = "wanAndroid";

  final _titles = ["首页", "知识体系", "公众号", "导航", "项目"];
  var _currentIndex = 0;

  final _pages = [
    HomePage(),
    KnowledgeTreePage(),
    WeChatPage(),
    NavigationPage(),
    ProjectPage()
  ];

  var _title = "";

//  static BuildContext _context;

  /// 底部按钮点击监听
  void _bottomNavigationBar(int index) {
    _currentIndex = index;
    setState(() {
      if (index == 0) {
        _title = wanAndroid;
      } else {
        _title = _titles[index];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    _context = context;
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[Icon(Icons.search)],
        title: Text(_title),
        centerTitle: true, //标题居中显示
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        //
        fixedColor: Colors.blue,
        items: _createBottomNavigationBarItem(),
        onTap: _bottomNavigationBar,
      ),
      floatingActionButton: new FloatingActionButton(onPressed: null),
      drawer: _createDrawer(),
      body: _pages[_currentIndex],
    );
  }

  static const collection = "收藏",
      todoTools = "TODO工具",
      settings = "设置",
      aboutUs = "关于我们";

  // 构建滑动菜单栏
  Widget _createDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: UserAccountsDrawerHeader(
                accountName: Text(
                  "登录",
                  textAlign: TextAlign.center,
                ),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                        Utils.jointImagePath("default_avatar.png")))),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text(collection),
            onTap: () {
              print("collection onPressed");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.today),
            title: Text(todoTools),
            onTap: () {
              print("todoTools onPressed");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(settings),
            onTap: () {
              print("settings onPressed");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(aboutUs),
            onTap: () {
              print("aboutUs onPressed");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Function _onDrawerTap = () {
//    Navigator.pop(_context);
    print(" onPressedonPressed");
//    switch (tag) {
//      case collection:
//        break;
//      case todoTools:
//        break;
//      case settings:
//        break;
//      case aboutUs:
//        break;
//    }
  };

  // 构建底部的Item
  List<BottomNavigationBarItem> _createBottomNavigationBarItem() {
    return [
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(Utils.jointImagePath("home.png"))),
          title: Text(_titles[0])),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(Utils.jointImagePath("article_tree.png"))),
          title: Text(_titles[1])),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(Utils.jointImagePath("we_chat.png"))),
          title: Text(_titles[2])),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(Utils.jointImagePath("navigation.png"))),
          title: Text(_titles[3])),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(Utils.jointImagePath("project.png"))),
          title: Text(_titles[4]))
    ];
  }
}
