import 'package:augsix/model/app_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

// ignore: non_constant_identifier_names
final Color? BACKGROUND_COLOR = Colors.green[100];

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  _EditPage createState() => _EditPage();
}

class _EditPage extends State<EditPage> {
  List<dynamic> json = HaiList.toList();
  late List<Widget> images;
  late List<Widget> manzuImages;
  late List<Widget> pinzuImages;
  late List<Widget> souzuImages;
  late List<Widget> jihaiImages;
  late List<Widget> tehaiImages;
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
              width: double.infinity,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text("手牌",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
            ),
            MaterialButton(
                onPressed: appData.agariCheckButtonIsDisabled ? () => fukeisan(context) : null,
                shape: const StadiumBorder(),
                color: Colors.deepOrangeAccent,
                child: appData.agariCheckButtonIsDisabled
                    ? const Text("上がりチェック", style: TextStyle(fontSize: 20,fontFamily: "OptFont",color: Colors.white,),)
                    : const Text("牌が少ないよ", style: TextStyle(fontSize: 20,fontFamily: "OptFont",),),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 20/9,
                enableInfiniteScroll: false,
                initialPage: 0,
                autoPlay: false,
                viewportFraction: 0.25,
              ),
              items: appData.tehai.map((element) => GestureDetector(
                child: Image.asset(element["image"]),
                onTap: () => setState(() => removeFromTehai(element["no"])),
                onDoubleTap: () => setState(() => ChangeHaiImage(element)),
              )).toList(),
            ),
            Container(
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
              child: const Text("萬子",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 28/9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 0,
                autoPlay: false,
                viewportFraction: 0.2,
              ),
              items: manzuImages,
            ),
            Container(
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
              child: const Text("筒子",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 28/9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 0,
                autoPlay: false,
                viewportFraction: 0.2,
              ),
              items: pinzuImages,
            ),
            Container(
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
              child: const Text("索子",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 28/9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 0,
                autoPlay: false,
                viewportFraction: 0.2,
              ),
              items: souzuImages,
            ),
            Container(
              width: double.infinity,
              color: Colors.lightGreen,
              alignment: Alignment.center,
              child: const Text("字牌",style: TextStyle(fontSize: 24,fontFamily: "OptFont",color: Colors.white,),),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 28/9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 0,
                autoPlay: false,
                viewportFraction: 0.2,
              ),
              items: jihaiImages,
            ),
          ],
        ),
      ),
    );
  }

  void addTehai(dynamic hai) {
    Map<String, Object> copy = {...hai};
    if(appData.tehai.length < 18) {
      int length = appData.tehai.where((element) => element["no"] == copy["no"]).toList().length;
      if (length < 4) {
        appData.tehai.add(copy);
        appData.tehai.sort((a, b) => a["no"] < b["no"] ? -1 : 1);
      }
    }
    if (appData.tehai.length >= 14) {
      appData.agariCheckButtonIsDisabled = true;
    } else {
      appData.agariCheckButtonIsDisabled = false;
    }
  }

  void removeFromTehai(int no) {
    appData.tehai.remove(appData.tehai.firstWhere((element) => element["no"]==no));
    if (appData.tehai.length >= 14) {
      appData.agariCheckButtonIsDisabled = true;
    } else {
      appData.agariCheckButtonIsDisabled = false;
    }
  }

  Future<void> fukeisan(BuildContext context) async {
    bool judge = AgariCheck(appData.tehai);
    bool? tsumo = false;
    String? machi = "両面";
    return showDialog<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: judge ? const Text("上がり！") : const Text("上がってないよ。"),
                  content: judge ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(Fukeisan(appData.tehai, tsumo, machi), style: const TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("上がり方", style: TextStyle(color: Colors.grey, fontFamily: "OptFont", fontSize: 20),),
                          DropdownButton(
                            underline: const SizedBox(),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                            borderRadius: BorderRadius.circular(10),
                            onChanged: (bool? value) => setState(() => tsumo = value),
                            items: const [
                              DropdownMenuItem(value: false,child: Text("ロン", style: TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),),
                              DropdownMenuItem(value: true,child: Text("ツモ", style: TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),),
                            ],
                            value: tsumo,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("待ち", style: TextStyle(color: Colors.grey, fontFamily: "OptFont", fontSize: 20),),
                          DropdownButton(
                            underline: const SizedBox(),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                            borderRadius: BorderRadius.circular(10),
                            onChanged: (String? value) => setState(() => machi = value),
                            items: const [
                              DropdownMenuItem(value: "両面",child: Text("両面", style: TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),),
                              DropdownMenuItem(value: "ペンチャン",child: Text("ペンチャン", style: TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),),
                              DropdownMenuItem(value: "カンチャン",child: Text("カンチャン", style: TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),),
                              DropdownMenuItem(value: "単騎",child: Text("単騎", style: TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),),
                              DropdownMenuItem(value: "延べ単",child: Text("延べ単", style: TextStyle(color: Colors.black, fontFamily: "OptFont", fontSize: 20),),),
                            ],
                            value: machi,
                          ),
                        ],
                      ),
                    ],
                  ) : null,
                );
              });
        });
  }
}