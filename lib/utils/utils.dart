// ignore_for_file: non_constant_identifier_names

import 'package:augsix/sub_page_view/agari_check_page.dart';
import 'package:augsix/sub_page_view/calc_page.dart';
import 'package:augsix/sub_page_view/scan_page.dart';
import 'package:augsix/sub_page_view/yaku_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../sub_page_view/edit_page.dart';

final List<dynamic> HaiList = [
  {"name": "一萬", "no":  0, "type": "萬子", "number": 1, "status": 0, "image": "resource/pai-images/man1-66-90-l.png"},
  {"name": "ニ萬", "no":  1, "type": "萬子", "number": 2, "status": 0, "image": "resource/pai-images/man2-66-90-l.png"},
  {"name": "三萬", "no":  2, "type": "萬子", "number": 3, "status": 0, "image": "resource/pai-images/man3-66-90-l.png"},
  {"name": "四萬", "no":  3, "type": "萬子", "number": 4, "status": 0, "image": "resource/pai-images/man4-66-90-l.png"},
  {"name": "五萬", "no":  4, "type": "萬子", "number": 5, "status": 0, "image": "resource/pai-images/man5-66-90-l.png"},
  {"name": "六萬", "no":  5, "type": "萬子", "number": 6, "status": 0, "image": "resource/pai-images/man6-66-90-l.png"},
  {"name": "七萬", "no":  6, "type": "萬子", "number": 7, "status": 0, "image": "resource/pai-images/man7-66-90-l.png"},
  {"name": "八萬", "no":  7, "type": "萬子", "number": 8, "status": 0, "image": "resource/pai-images/man8-66-90-l.png"},
  {"name": "九萬", "no":  8, "type": "萬子", "number": 9, "status": 0, "image": "resource/pai-images/man9-66-90-l.png"},
  {"name": "一索", "no":  9, "type": "索子", "number": 1, "status": 0, "image": "resource/pai-images/sou1-66-90-l.png"},
  {"name": "ニ索", "no": 10, "type": "索子", "number": 2, "status": 0, "image": "resource/pai-images/sou2-66-90-l.png"},
  {"name": "三索", "no": 11, "type": "索子", "number": 3, "status": 0, "image": "resource/pai-images/sou3-66-90-l.png"},
  {"name": "四索", "no": 12, "type": "索子", "number": 4, "status": 0, "image": "resource/pai-images/sou4-66-90-l.png"},
  {"name": "五索", "no": 13, "type": "索子", "number": 5, "status": 0, "image": "resource/pai-images/sou5-66-90-l.png"},
  {"name": "六索", "no": 14, "type": "索子", "number": 6, "status": 0, "image": "resource/pai-images/sou6-66-90-l.png"},
  {"name": "七索", "no": 15, "type": "索子", "number": 7, "status": 0, "image": "resource/pai-images/sou7-66-90-l.png"},
  {"name": "八索", "no": 16, "type": "索子", "number": 8, "status": 0, "image": "resource/pai-images/sou8-66-90-l.png"},
  {"name": "九索", "no": 17, "type": "索子", "number": 9, "status": 0, "image": "resource/pai-images/sou9-66-90-l.png"},
  {"name": "一筒", "no": 18, "type": "筒子", "number": 1, "status": 0, "image": "resource/pai-images/pin1-66-90-l.png"},
  {"name": "ニ筒", "no": 19, "type": "筒子", "number": 2, "status": 0, "image": "resource/pai-images/pin2-66-90-l.png"},
  {"name": "三筒", "no": 20, "type": "筒子", "number": 3, "status": 0, "image": "resource/pai-images/pin3-66-90-l.png"},
  {"name": "四筒", "no": 21, "type": "筒子", "number": 4, "status": 0, "image": "resource/pai-images/pin4-66-90-l.png"},
  {"name": "五筒", "no": 22, "type": "筒子", "number": 5, "status": 0, "image": "resource/pai-images/pin5-66-90-l.png"},
  {"name": "六筒", "no": 23, "type": "筒子", "number": 6, "status": 0, "image": "resource/pai-images/pin6-66-90-l.png"},
  {"name": "七筒", "no": 24, "type": "筒子", "number": 7, "status": 0, "image": "resource/pai-images/pin7-66-90-l.png"},
  {"name": "八筒", "no": 25, "type": "筒子", "number": 8, "status": 0, "image": "resource/pai-images/pin8-66-90-l.png"},
  {"name": "九筒", "no": 26, "type": "筒子", "number": 9, "status": 0, "image": "resource/pai-images/pin9-66-90-l.png"},
  {"name": "白" , "no": 27, "type": "三元牌", "number": 0, "status": 0, "image": "resource/pai-images/ji6-66-90-l.png"},
  {"name": "發" , "no": 28, "type": "三元牌", "number": 0, "status": 0, "image": "resource/pai-images/ji5-66-90-l.png"},
  {"name": "中" , "no": 29, "type": "三元牌", "number": 0, "status": 0, "image": "resource/pai-images/ji7-66-90-l.png"},
  {"name": "東" , "no": 30, "type": "風牌", "number": 0, "status": 0, "image": "resource/pai-images/ji1-66-90-l.png"},
  {"name": "南" , "no": 31, "type": "風牌", "number": 0, "status": 0, "image": "resource/pai-images/ji2-66-90-l.png"},
  {"name": "西" , "no": 32, "type": "風牌", "number": 0, "status": 0, "image": "resource/pai-images/ji3-66-90-l.png"},
  {"name": "北" , "no": 33, "type": "風牌", "number": 0, "status": 0, "image": "resource/pai-images/ji4-66-90-l.png"}
];

Future<dynamic> LoadJson(String path) async {
  return jsonDecode(await rootBundle.loadString(path));
}

Widget? SelectPage(BuildContext context, String name) {
  switch(name){
    case "持ち点管理":
      return const CalcPage();
    case "役リスト":
      return const YakuListPage().build(context);
    case "手牌スキャン":
      return const ScanPage();
    case "手牌編集":
      return const EditPage();
    case "上がりチェック":
      return const AgariCheckPage([]);
    default:
      return Text(name);
  }
}

String HansuTextCheck(int hansu) {
  if(hansu==13){
    return "役満";
  } else if(hansu==99) {
    return "ダブル役満";
  } else {
    return "$hansu翻";
  }
}

String MakeNakiText(String isNakiAri, int hansu) {
  if (isNakiAri=="0"){
    return "鳴き: なし";
  } else {
    return "鳴き　　: あり\n鳴きあり: ${HansuTextCheck(hansu)}";
  }
}

bool AgariCheck(List<dynamic> tehai) {
  List<dynamic> tmp = JuntsuCheck(tehai);
  tmp = KotsuCheck(tmp);
  bool result = AtamaCheck(tmp) || ChiToitsuCheck(tehai) || KokushiCheck(tehai);
  return result;
}

bool KokushiCheck(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.map((e) => e["no"]).toList();
  List<dynamic> kokushiTemplate = HaiList.where((e) => e["number"] == 1 || e["number"] == 9 || e["type"] == "三元牌" || e["type"] == "風牌").map((e) => e["no"]).toList();
  if(tmp.toSet().length == 13) {
    for(dynamic kokushiHai in kokushiTemplate) {
      tmp.remove(kokushiHai);
    }
    if(tmp.length == 1) {
      return kokushiTemplate.contains(tmp.first);
    }
  }
  return false;
}

bool ChiToitsuCheck(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.map((e) => e["no"]).toList();
  for(dynamic tehai in tmp.toSet()) {
    if(tehaiList.where((e) => e["no"] == tehai).length == 2) {
      continue;
    } else {
      return false;
    }
  }
  return tmp.toSet().length == 7;
}

bool AtamaCheck(List<dynamic> tehai) {
  Set<int> tmp = tehai.map((e) => e["no"] as int).toSet();
  if(tmp.length == 1) {
    return tehai.length == 2;
  }
  return false;
}

List<dynamic> KotsuCheck(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.toList();
  Set<dynamic> tehaiSet = tehaiList.toSet();
  for(dynamic tehai in tehaiSet) {
    if(tmp.where((e) => e["no"] == tehai["no"]).length == 3 || tmp.where((e) => e["no"] == tehai["no"]).length == 4) {
      tmp.removeWhere((e) => e["no"] == tehai["no"]);
    }
  }
  return tmp;
}

List<dynamic> JuntsuCheck(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.toList();
  List<dynamic> manzuList = HaiList.where((e) => e["type"] == "萬子").toList();
  List<dynamic> pinzuList = HaiList.where((e) => e["type"] == "筒子").toList();
  List<dynamic> souzuList = HaiList.where((e) => e["type"] == "索子").toList();

  bool loop = true;
  for(int i = 0; i <= 9-3; i++) {
    int start = i;
    int end = i+3;
    loop = true;
    while(loop) {
      for(dynamic manzu in manzuList.sublist(start, end)) {
        if(tmp.map((e) => e["no"]).toList().contains(manzu["no"])) {
          continue;
        } else {
          loop = false;
          break;
        }
      }
      if(loop==true) {
        manzuList.sublist(start, end).forEach((e) => tmp.remove(tmp.where((tmpElement) => tmpElement["no"] == e["no"]).first));
      }
    }
    loop = true;
    while(loop) {
      for(dynamic pinzu in pinzuList.sublist(start, end)) {
        if(tmp.map((e) => e["no"]).toList().contains(pinzu["no"])) {
          continue;
        } else {
          loop = false;
          break;
        }
      }
      if(loop==true) {
        pinzuList.sublist(start, end).forEach((e) => tmp.remove(tmp.where((tmpElement) => tmpElement["no"] == e["no"]).first));
      }
    }
    loop = true;
    while(loop) {
      for(dynamic souzu in souzuList.sublist(start, end)) {
        if(tmp.map((e) => e["no"]).toList().contains(souzu["no"])) {
          continue;
        } else {
          loop = false;
          break;
        }
      }
      if(loop==true) {
        souzuList.sublist(start, end).forEach((e) => tmp.remove(tmp.where((tmpElement) => tmpElement["no"] == e["no"]).first));
      }
    }
  }
  return tmp;
}

void ChangeHaiImage(dynamic tehai) {
  if(tehai["image"].toString().contains("-yoko")) {
    tehai["image"] = tehai["image"].toString().replaceFirst("-yoko", "");
    tehai["status"] = 0;
  } else {
    tehai["image"] = tehai["image"].toString().replaceFirst(".png", "-yoko.png");
    tehai["status"] = 1;
  }
}

String Fukeisan(List<dynamic> tehaiList, bool? tsumo, String? machi) {
  int result = 20;
  if(ChiToitsuCheck(tehaiList)) {
    result = 25;
    return "$result 符";
  }
  if (machi != null) {
    switch(machi) {
      case "両面":
        break;
      default:
        result = result + 2;
        break;
    }
  }
  if(tsumo != null) {
    if(tsumo) {
      result = result + 2;
    }
  }
  List<dynamic> kotsu = KotsuList(JuntsuCheck(tehaiList));
  if(kotsu.isNotEmpty) {
    Set<int> tmp = kotsu.map((e) => e["no"] as int).toSet();
    for(int no in tmp) {
      int length = kotsu.where((e) => (e["no"] as int) == no).length;
      if(length == 3) {
        if(kotsu.where((e) => (e["no"] as int) == no).where((e) => e["number"] == 1 || e["number"] == 9 || e["type"] == "三元牌" || e["type"] == "風牌").isNotEmpty){
          if(kotsu.where((e) => (e["no"] as int) == no).where((e) => e["status"] == 1).isEmpty) {
            result = result + 8;
          } else {
            result = result + 4;
          }
        } else {
          if(kotsu.where((e) => (e["no"] as int) == no).where((e) => e["status"] == 1).isEmpty) {
            result = result + 4;
          } else {
            result = result + 2;
          }
        }
      } else if(length == 4) {
        if(kotsu.where((e) => (e["no"] as int) == no).where((e) => e["number"] == 1 || e["number"] == 9 || e["type"] == "三元牌" || e["type"] == "風牌").isNotEmpty){
          if(kotsu.where((e) => (e["no"] as int) == no).where((e) => e["status"] == 1).isEmpty) {
            result = result + 32;
          } else {
            result = result + 16;
          }
        } else {
          if(kotsu.where((e) => (e["no"] as int) == no).where((e) => e["status"] == 1).isEmpty) {
            result = result + 16;
          } else {
            result = result + 8;
          }
        }
      }
    }
  }
  if(tehaiList.where((e) => e["status"] == 1).isEmpty) {
    result = result + 10;
  }
  if(result % 10 > 0) {
    result = result - (result%10) + 10;
  }
  return "$result 符";
}

List<dynamic> KotsuList(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.toList();
  Set<int> tehaiSet = tehaiList.map((e) => e["no"] as int).toSet();
  List<dynamic> result = [];
  for(int tehaiNo in tehaiSet) {
    if(tmp.where((e) => e["no"] == tehaiNo).length == 3 || tmp.where((e) => e["no"] == tehaiNo).length == 4) {
      result.addAll(tmp.where((e) => e["no"] == tehaiNo).toList());
    }
  }
  return result;
}
