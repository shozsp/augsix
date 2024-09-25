import 'package:augsix/sub_page_view/agari_check_page.dart';
import 'package:augsix/sub_page_view/calc_page.dart';
import 'package:augsix/sub_page_view/scan_page.dart';
import 'package:augsix/sub_page_view/yaku_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../sub_page_view/edit_page.dart';

final List<dynamic> haiList = [
  {"name": "一萬", "no":  0, "type": "萬子", "number": 1, "image": "resource/pai-images/man1-66-90-l.png"},
  {"name": "ニ萬", "no":  1, "type": "萬子", "number": 2, "image": "resource/pai-images/man2-66-90-l.png"},
  {"name": "三萬", "no":  2, "type": "萬子", "number": 3, "image": "resource/pai-images/man3-66-90-l.png"},
  {"name": "四萬", "no":  3, "type": "萬子", "number": 4, "image": "resource/pai-images/man4-66-90-l.png"},
  {"name": "五萬", "no":  4, "type": "萬子", "number": 5, "image": "resource/pai-images/man5-66-90-l.png"},
  {"name": "六萬", "no":  5, "type": "萬子", "number": 6, "image": "resource/pai-images/man6-66-90-l.png"},
  {"name": "七萬", "no":  6, "type": "萬子", "number": 7, "image": "resource/pai-images/man7-66-90-l.png"},
  {"name": "八萬", "no":  7, "type": "萬子", "number": 8, "image": "resource/pai-images/man8-66-90-l.png"},
  {"name": "九萬", "no":  8, "type": "萬子", "number": 9, "image": "resource/pai-images/man9-66-90-l.png"},
  {"name": "一索", "no":  9, "type": "索子", "number": 1, "image": "resource/pai-images/sou1-66-90-l.png"},
  {"name": "ニ索", "no": 10, "type": "索子", "number": 2, "image": "resource/pai-images/sou2-66-90-l.png"},
  {"name": "三索", "no": 11, "type": "索子", "number": 3, "image": "resource/pai-images/sou3-66-90-l.png"},
  {"name": "四索", "no": 12, "type": "索子", "number": 4, "image": "resource/pai-images/sou4-66-90-l.png"},
  {"name": "五索", "no": 13, "type": "索子", "number": 5, "image": "resource/pai-images/sou5-66-90-l.png"},
  {"name": "六索", "no": 14, "type": "索子", "number": 6, "image": "resource/pai-images/sou6-66-90-l.png"},
  {"name": "七索", "no": 15, "type": "索子", "number": 7, "image": "resource/pai-images/sou7-66-90-l.png"},
  {"name": "八索", "no": 16, "type": "索子", "number": 8, "image": "resource/pai-images/sou8-66-90-l.png"},
  {"name": "九索", "no": 17, "type": "索子", "number": 9, "image": "resource/pai-images/sou9-66-90-l.png"},
  {"name": "一筒", "no": 18, "type": "筒子", "number": 1, "image": "resource/pai-images/pin1-66-90-l.png"},
  {"name": "ニ筒", "no": 19, "type": "筒子", "number": 2, "image": "resource/pai-images/pin2-66-90-l.png"},
  {"name": "三筒", "no": 20, "type": "筒子", "number": 3, "image": "resource/pai-images/pin3-66-90-l.png"},
  {"name": "四筒", "no": 21, "type": "筒子", "number": 4, "image": "resource/pai-images/pin4-66-90-l.png"},
  {"name": "五筒", "no": 22, "type": "筒子", "number": 5, "image": "resource/pai-images/pin5-66-90-l.png"},
  {"name": "六筒", "no": 23, "type": "筒子", "number": 6, "image": "resource/pai-images/pin6-66-90-l.png"},
  {"name": "七筒", "no": 24, "type": "筒子", "number": 7, "image": "resource/pai-images/pin7-66-90-l.png"},
  {"name": "八筒", "no": 25, "type": "筒子", "number": 8, "image": "resource/pai-images/pin8-66-90-l.png"},
  {"name": "九筒", "no": 26, "type": "筒子", "number": 9, "image": "resource/pai-images/pin9-66-90-l.png"},
  {"name": "白" , "no": 27, "type": "三元牌", "number": 0, "image": "resource/pai-images/ji6-66-90-l.png"},
  {"name": "發" , "no": 28, "type": "三元牌", "number": 0, "image": "resource/pai-images/ji5-66-90-l.png"},
  {"name": "中" , "no": 29, "type": "三元牌", "number": 0, "image": "resource/pai-images/ji7-66-90-l.png"},
  {"name": "東" , "no": 30, "type": "風牌", "number": 0, "image": "resource/pai-images/ji1-66-90-l.png"},
  {"name": "南" , "no": 31, "type": "風牌", "number": 0, "image": "resource/pai-images/ji2-66-90-l.png"},
  {"name": "西" , "no": 32, "type": "風牌", "number": 0, "image": "resource/pai-images/ji3-66-90-l.png"},
  {"name": "北" , "no": 33, "type": "風牌", "number": 0, "image": "resource/pai-images/ji4-66-90-l.png"}
];

Future<dynamic> loadJson(String path) async {
  return jsonDecode(await rootBundle.loadString(path));
}

Widget? selectPage(BuildContext context, String name) {
  switch(name){
    case "持ち点管理":
      return CalcPage();
    case "役リスト":
      return YakuListPage().build(context);
    case "手牌スキャン":
      return ScanPage();
    case "手牌編集":
      return EditPage();
    case "上がりチェック":
      return AgariCheckPage([]);
    default:
      return Text(name);
  }
}

String hansuTextCheck(int hansu) {
  if(hansu==13){
    return "役満";
  } else if(hansu==99) {
    return "ダブル役満";
  } else {
    return hansu.toString() + "翻";
  }
}

String makeNakiText(String isNakiAri, int hansu) {
  if (isNakiAri=="0"){
    return "鳴き: なし";
  } else {
    return "鳴き　　: あり\n鳴きあり: ${hansuTextCheck(hansu)}";
  }
}

bool agariCheck(List<dynamic> tehai) {
  List<dynamic> tmp = juntsuCheck(tehai);
  tmp = kotsuCheck(tmp);
  return atamaCheck(tmp) || chiToitsuCheck(tehai) || kokushiCheck(tehai);
}

bool kokushiCheck(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.toList();
  List<dynamic> kokushiTemplate = haiList.where((e) => e["number"] == 1 || e["number"] == 9 || e["type"] == "三元牌" || e["type"] == "風牌").toList();
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

bool chiToitsuCheck(List<dynamic> tehaiList) {
  for(dynamic tehai in tehaiList.toSet()) {
    if(tehaiList.where((e) => e == tehai).length == 2) {
      continue;
    } else {
      return false;
    }
  }
  return tehaiList.toSet().length == 7;
}
bool atamaCheck(List<dynamic> tehai) {
  if(tehai.toSet().length == 1) {
    return tehai.length == 2;
  }
  return false;
}

List<dynamic> kotsuCheck(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.toList();
  Set<dynamic> tehaiSet = tehaiList.toSet();
  for(dynamic tehai in tehaiSet) {
    if(tmp.where((e) => e == tehai).length == 3 || tmp.where((e) => e == tehai).length == 4) {
      tmp.removeWhere((e) => e == tehai);
    }
  }
  return tmp;
}

List<dynamic> juntsuCheck(List<dynamic> tehaiList) {
  List<dynamic> tmp = tehaiList.toList();
  List<dynamic> manzuList = haiList.where((e) => e["type"] == "萬子").toList();
  List<dynamic> pinzuList = haiList.where((e) => e["type"] == "筒子").toList();
  List<dynamic> souzuList = haiList.where((e) => e["type"] == "索子").toList();

  bool loop = true;
  for(int i = 0; i <= 9-3; i++) {
    int start = i;
    int end = i+3;
    loop = true;
    while(loop) {
      for(dynamic manzu in manzuList.sublist(start, end)) {
        if(tmp.contains(manzu)) {
          continue;
        } else {
          loop = false;
          break;
        }
      }
      if(loop==true) {
        manzuList.sublist(start, end).forEach((e) => tmp.remove(e));
      }
    }
    loop = true;
    while(loop) {
      for(dynamic pinzu in pinzuList.sublist(start, end)) {
        if(tmp.contains(pinzu)) {
          continue;
        } else {
          loop = false;
          break;
        }
      }
      if(loop==true) {
        pinzuList.sublist(start, end).forEach((e) => tmp.remove(e));
      }
    }
    loop = true;
    while(loop) {
      for(dynamic souzu in souzuList.sublist(start, end)) {
        if(tmp.contains(souzu)) {
          continue;
        } else {
          loop = false;
          break;
        }
      }
      if(loop==true) {
        souzuList.sublist(start, end).forEach((e) => tmp.remove(e));
      }
    }
  }

  return tmp;
}