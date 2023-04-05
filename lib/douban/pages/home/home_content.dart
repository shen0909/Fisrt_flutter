import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/douban/pages/home/home_movie_itemwidget.dart';
import 'package:flutterapp/network/home_request.dart';

import '../../model/home_model.dart';
/*首页内容页*/
class HYHomeContent extends StatefulWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {

  final List<MovieItem>movies=[];

  /*发送网络请求，请求数据*/
  void initState(){
    super.initState();
    /*请求到的数据被返回放在了then的value中*/
    HomeRequest.requestMovieList().then((value){
      //print("返回数据后打印：$value");
      /*存在数据更新，所以要使用setState*/
      setState((){
        movies.addAll(value);//遍历value并且将他放到数组movies当中去
      });
    });
   
  }
  /*渲染widget 怎样显示获取的内容*/
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext ctx ,int index){
        return HYHomeMovieItem(movies[index]);//每次传入数组中的一个信息
      },
      itemCount:movies.length ,//item个数=数组长度
    );
  }
}


