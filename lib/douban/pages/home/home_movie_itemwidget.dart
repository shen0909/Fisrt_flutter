import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/douban/model/home_model.dart';

import '../../widgets/dashLine.dart';
import '../../widgets/star_rating.dart';

/*在首页 home中使用*/
class HYHomeMovieItem extends StatelessWidget {
  /*必须要先导入模型*/
  final MovieItem movieItem;

   HYHomeMovieItem(this.movieItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      //增加底部边框
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 4,color: Color(0xffcccccc))
          )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          build_head_ranking(),
          SizedBox(height: 8,),
          build_content_info(),
          SizedBox(height: 8,),
          button_info(),
        ],
      )
    );
  }

  //头部电影排名
  Widget build_head_ranking(){
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color:Color.fromARGB(255, 238, 208, 144),
          borderRadius: BorderRadius.circular(3)//圆角
      ),
      child: Text("NO.${movieItem.rank}",style: TextStyle(fontSize: 11.5,color: Color.fromARGB(255, 131, 95, 35)),),
    );
  }
  //影片信息（图片、评分等）
  Widget build_content_info(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        movie_image(),//影片图片
        movie_info(),//影片信息
        SizedBox(width:90),
        movie_info_dashline(),
        want_watch(),
      ],
    );
  }
  //电影图片
  /*ClipRRect===>给图片设定圆角*/
  Widget movie_image(){
    return ClipRRect(
      borderRadius:BorderRadius.circular(8),
        child: Image(
          image: NetworkImage("${movieItem.cover}"),
          height: 100,width: 90,),
    );
  }
  //影片信息
  Widget movie_info(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        movie_info_title(),//标题
        Row(
          children: [
            HYStarRating(rating:movieItem.rate,maxrating: 10,size: 15,selectedColor: Colors.orange,),
            SizedBox(width:9),
            Text("${movieItem.rate}"),

          ],
        ),
      ],
    );
  }
  //影片标题
  Widget movie_info_title(){
    /*Row不能换行===》使用Text.rich*/
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.play_circle_outline,color: Colors.red,size: 16,),
        SizedBox(width:3),
        Text("${movieItem.title}",style: TextStyle(fontSize:18 ),),//标题
      ],
    );
  }

  //内容虚线
  Widget movie_info_dashline(){
    return HYDashLine(axis: Axis.vertical,dashedHeight: 10,dasheWidth: 1,count: 9,);
  }
  //内容想看
  Widget want_watch(){
    return Container(
      padding: EdgeInsets.all(9),
      alignment: Alignment.center,
      height: 100,
      width: 90,
      //color: Colors.orange,
      child: Row(
        //crossAxisAlignment: ,
        children: [
          Image(image: AssetImage("assets/doubanHome/wish.png"),height: 30,),
          Text("想看"),
        ],
      ),
    );
  }

  //底部网址信息
  Widget button_info(){
    return Container(
      padding: EdgeInsets.all(6),
      width: double.infinity,//无限，尽可能打
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(5)
      ),

        child: Text("${movieItem.url}")
    );
  }
}





