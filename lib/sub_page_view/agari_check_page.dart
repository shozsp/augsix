import 'package:flutter/material.dart';

class AgariCheckPage extends StatefulWidget {
  final List<dynamic> tehai;
  _AgariCheckPage createState() => _AgariCheckPage();
  AgariCheckPage(this.tehai);
}

class _AgariCheckPage extends State<AgariCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: widget.tehai.map((element) => Text(element["name"]+",")).toList(),
      ),
    );
  }
}