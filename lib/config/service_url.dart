import 'package:dio/dio.dart';
import 'httpHeaders.dart';

// 请求数据，get可换post请求
//Future getHttp() async{
//  try{
//    Response response;
//    Dio dio = new Dio();
//    dio.options.headers = httpHeaders;
//    response = await dio.get("http://time.geekbang.org/serv/v1/column/newAll");
//    print(response);
//    return response.data;
//  } catch(e){
//    return print(e);
//  }
//}

const serviceUrl= 'xxxxxx';
const servicePath={
  'homePageContext': serviceUrl+'wxmini/homePageContent', // 商家首页信息
};