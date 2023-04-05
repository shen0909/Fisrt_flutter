import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_content.dart';

class HYhomePage extends StatelessWidget {
  const HYhomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("热门影片")),
      ),
      body:HYHomeContent() ,
    );
  }
}
