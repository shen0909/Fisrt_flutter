/*
* json转model*/

int count=1;
class MovieItem{
  int ? rank=0;
  String ? episodes_info;
  double rate=0;
  String ? title;
  String ?url;
  bool ? playable;
  String ?cover;
  bool ? is_new;

  MovieItem(this.episodes_info,this.rate,this.title,this.is_new,this.cover,this.url);

  /*传入要给map对象，从对象中取出一个数据赋值*/
  MovieItem.fromMap(Map<String,dynamic> jsonStr)
  {
    rank=count++;
    this.episodes_info=jsonStr['episodes_info'];
    this.rate=double.parse(jsonStr['rate'].toString());//评分
    this.title=jsonStr['title'];
    this.cover=jsonStr['cover'];//图片
    this.url=jsonStr['url'];
  }

  /*重写 toString获得真正的内容*/
  @override
  String toString() {
    return 'MovieItem{rank:$rank,rate:$rate,episodes_info:$episodes_info,title:$title,url:$url,playable:$playable,cover$cover,is_new:$is_new,url:$url\n}';
  }
}