import 'package:augsix/sub_page_view/fukeisan_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

final Color? BACKGROUND_COLOR = Colors.green[100];

class EditPage extends StatefulWidget {
  _EditPage createState() => _EditPage();
}

class _EditPage extends State<EditPage> {
  List<dynamic> json = haiList;
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
                  onPressed: _isDisabled ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => FukeisanPage(tehai))) : null,
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