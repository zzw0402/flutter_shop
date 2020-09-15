import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎来到测试酒店';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('测试测试'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '测试类型',
                    helperText: '请输入你要选择的测试类型'
                ),
                // 关闭自动对焦，不会自动打开键盘
                autofocus: false,
              ),
              RaisedButton(
                onPressed: _choiceAction,
                child: Text('选择完毕'),
              ),
              Text(
                showText,
                // 超出显示会显示...
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction(){
    print('选择你喜欢的类型');
    if(typeController.text.toString() == ''){
      // 提示
      showDialog(context: context, builder: (context) => AlertDialog(title: Text('类型不能为空'),));
    }else{
      // val代表的是gethttp返回的值
      getHttp(typeController.text.toString()).then((val){
        setState(() {
          showText = val['dart']['name'].toString();
        });
      });
    }
  }

  // 可以用then进行回调
    Future getHttp(String TypeText) async {
    try {
      // 返回值，服务器 + 返回的对象
      Response response;
      var data = {'name': TypeText};
      response = await Dio().get(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=测试",
          queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

}







