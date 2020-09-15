// material风格是谷歌推出的全新设计语言，和其他平台提供一致和更广泛的外观的效果制作的
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ios 风格
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_shop.dart';
import 'member_page.dart';

// 静态组件
//class IndexPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('百姓生活+'),
//      ),
//      body:Center(
//        child: Text('百姓生活+'),
//      ),
//    );
//  }
//}

// 页面发生变化，动态组件
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 不希望被改变
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      title: Text('首页'),
      icon: Icon(CupertinoIcons.home),
    ),
    BottomNavigationBarItem(
      title: Text('分类'),
      icon: Icon(CupertinoIcons.home),
    ),
    BottomNavigationBarItem(
      title: Text('购物车'),
      icon: Icon(CupertinoIcons.home),
    ),
    BottomNavigationBarItem(
      title: Text('会员中心'),
      icon: Icon(CupertinoIcons.home),
    ),
  ];

  // 放在列表中
  final List tabBoides = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  // 默认索引为1
  int currentIndex = 0;
  // 索引对应的列表
  var currentPage;

  // 初始化数据
  @override
  void initState() {
    currentPage = tabBoides[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      // 底部
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBoides[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
