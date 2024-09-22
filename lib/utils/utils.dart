import 'package:augsix/sub_page_view/agari_check_page.dart';
import 'package:augsix/sub_page_view/calc_page.dart';
import 'package:augsix/sub_page_view/scan_page.dart';
import 'package:augsix/sub_page_view/yaku_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../sub_page_view/edit_page.dart';

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