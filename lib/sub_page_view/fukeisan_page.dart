import 'package:flutter/material.dart';

import '../utils/utils.dart';

class FukeisanPage extends StatefulWidget {
  final List<dynamic> tehai;
  _FukeisanPage createState() => _FukeisanPage();
  FukeisanPage(this.tehai);
}

class _FukeisanPage extends State<FukeisanPage> {
  int result = 20;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(AgariCheck(widget.tehai) ? "あがり！！！！！！！！！" : "上がってないよ。")],
      ),
    );
  }
}