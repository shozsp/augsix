import 'dart:convert';

import 'package:augsix/sub_page_view/agari_check_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final Color? BACKGROUND_COLOR = Colors.green[100];

class EditPage extends StatefulWidget {
  _EditPage createState() => _EditPage();
}

class _EditPage extends State<EditPage> {
  List<dynamic> json = [
    {"name": "一萬", "no":  0, "type": 0, "number": 1, "image": "resource/pai-images/man1-66-90-l.png"},
    {"name": "ニ萬", "no":  1, "type": 0, "number": 2, "image": "resource/pai-images/man2-66-90-l.png"},
    {"name": "三萬", "no":  2, "type": 0, "number": 3, "image": "resource/pai-images/man3-66-90-l.png"},
    {"name": "四萬", "no":  3, "type": 0, "number": 4, "image": "resource/pai-images/man4-66-90-l.png"},
    {"name": "五萬", "no":  4, "type": 0, "number": 5, "image": "resource/pai-images/man5-66-90-l.png"},
    {"name": "六萬", "no":  5, "type": 0, "number": 6, "image": "resource/pai-images/man6-66-90-l.png"},
    {"name": "七萬", "no":  6, "type": 0, "number": 7, "image": "resource/pai-images/man7-66-90-l.png"},
    {"name": "八萬", "no":  7, "type": 0, "number": 8, "image": "resource/pai-images/man8-66-90-l.png"},
    {"name": "九萬", "no":  8, "type": 0, "number": 9, "image": "resource/pai-images/man9-66-90-l.png"},
    {"name": "一索", "no":  9, "type": 1, "number": 1, "image": "resource/pai-images/sou1-66-90-l.png"},
    {"name": "ニ索", "no": 10, "type": 1, "number": 2, "image": "resource/pai-images/sou2-66-90-l.png"},
    {"name": "三索", "no": 11, "type": 1, "number": 3, "image": "resource/pai-images/sou3-66-90-l.png"},
    {"name": "四索", "no": 12, "type": 1, "number": 4, "image": "resource/pai-images/sou4-66-90-l.png"},
    {"name": "五索", "no": 13, "type": 1, "number": 5, "image": "resource/pai-images/sou5-66-90-l.png"},
    {"name": "六索", "no": 14, "type": 1, "number": 6, "image": "resource/pai-images/sou6-66-90-l.png"},
    {"name": "七索", "no": 15, "type": 1, "number": 7, "image": "resource/pai-images/sou7-66-90-l.png"},
    {"name": "八索", "no": 16, "type": 1, "number": 8, "image": "resource/pai-images/sou8-66-90-l.png"},
    {"name": "九索", "no": 17, "type": 1, "number": 9, "image": "resource/pai-images/sou9-66-90-l.png"},
    {"name": "一筒", "no": 18, "type": 2, "number": 1, "image": "resource/pai-images/pin1-66-90-l.png"},
    {"name": "ニ筒", "no": 19, "type": 2, "number": 2, "image": "resource/pai-images/pin2-66-90-l.png"},
    {"name": "三筒", "no": 20, "type": 2, "number": 3, "image": "resource/pai-images/pin3-66-90-l.png"},
    {"name": "四筒", "no": 21, "type": 2, "number": 4, "image": "resource/pai-images/pin4-66-90-l.png"},
    {"name": "五筒", "no": 22, "type": 2, "number": 5, "image": "resource/pai-images/pin5-66-90-l.png"},
    {"name": "六筒", "no": 23, "type": 2, "number": 6, "image": "resource/pai-images/pin6-66-90-l.png"},
    {"name": "七筒", "no": 24, "type": 2, "number": 7, "image": "resource/pai-images/pin7-66-90-l.png"},
    {"name": "八筒", "no": 25, "type": 2, "number": 8, "image": "resource/pai-images/pin8-66-90-l.png"},
    {"name": "九筒", "no": 26, "type": 2, "number": 9, "image": "resource/pai-images/pin9-66-90-l.png"},
    {"name": "白" , "no": 27, "type": 3, "number": 0, "image": "resource/pai-images/ji6-66-90-l.png"},
    {"name": "發" , "no": 28, "type": 3, "number": 0, "image": "resource/pai-images/ji5-66-90-l.png"},
    {"name": "中" , "no": 29, "type": 3, "number": 0, "image": "resource/pai-images/ji7-66-90-l.png"},
    {"name": "東" , "no": 30, "type": 4, "number": 0, "image": "resource/pai-images/ji1-66-90-l.png"},
    {"name": "南" , "no": 31, "type": 4, "number": 0, "image": "resource/pai-images/ji2-66-90-l.png"},
    {"name": "西" , "no": 32, "type": 4, "number": 0, "image": "resource/pai-images/ji3-66-90-l.png"},
    {"name": "北" , "no": 33, "type": 4, "number": 0, "image": "resource/pai-images/ji4-66-90-l.png"}
  ];
  late List<Widget> images;
  late List<Widget> manzuImages;
  late List<Widget> pinzuImages;
  late List<Widget> souzuImages;
  late List<Widget> jihaiImages;
  late List<Widget> tehaiImages;
  List<dynamic> tehai = [];
  bool _isDisabled = false;
  @override
  void initState() {
    super.initState();
    var hai = jsonDecode(jsonEncode(json));
    images = json.map((element) => GestureDetector(
      child: Image.asset(element["image"]),
      onTap: () => setState(() => addTehai(element)),
    )).toList();
    manzuImages = images.sublist(0,9);
    pinzuImages = images.sublist(9,18);
    souzuImages = images.sublist(18,27);
    jihaiImages = images.sublist(27,34);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text("手牌",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
              width: double.infinity,
              color: Colors.green,
              alignment: Alignment.center,
            ),
            Container(
              child: MaterialButton(
                  onPressed: _isDisabled ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => AgariCheckPage(tehai))) : null,
                  child: _isDisabled
                      ? Text("上がりチェック", style: TextStyle(fontSize: 20,fontFamily: "OptFont",color: Colors.white,),)
                      : Text("牌が少ないよ", style: TextStyle(fontSize: 20,fontFamily: "OptFont",),),
                  shape: StadiumBorder(),
                  color: Colors.deepOrangeAccent,
              ),
            ),
            Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 20/9,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 0.25,
                  ),
                  items: tehai.map((element) => GestureDetector(child: Image.asset(element["image"]), onTap: () => setState(() => removeFromTehai(element["no"])),)).toList(),
                )
            ),
            Container(
              child: Text("萬子",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
            ),
            Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 28/9,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 0.2,
                  ),
                  items: manzuImages,
                )
            ),
            Container(
              child: Text("筒子",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
            ),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 28/9,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  autoPlay: false,
                  viewportFraction: 0.2,
                ),
                items: pinzuImages,
              )
            ),
            Container(
              child: Text("索子",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
            ),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 28/9,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  autoPlay: false,
                  viewportFraction: 0.2,
                ),
                items: souzuImages,
              )
            ),
            Container(
              child: Text("字牌",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
            ),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 28/9,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  autoPlay: false,
                  viewportFraction: 0.2,
                ),
                items: jihaiImages,
              )
            ),
          ],
        ),
      ),
    );
  }

  void addTehai(dynamic hai) {
    if(tehai.length < 18) {
      int length = tehai.where((element) => element["no"] == hai["no"]).toList().length;
      if (length < 4) {
        tehai.add(hai);
        tehai.sort((a, b) => a["no"] < b["no"] ? -1 : 1);
      }
    }
    if (tehai.length >= 14) {
      _isDisabled = true;
    } else {
      _isDisabled = false;
    }
  }

  void removeFromTehai(int no) {
    tehai.remove(tehai.firstWhere((element) => element["no"]==no));
    if (tehai.length >= 14) {
      _isDisabled = true;
    } else {
      _isDisabled = false;
    }
  }
}