import 'package:flutter/material.dart';

class AgariCheckPage extends StatefulWidget {
  final List<dynamic> tehai;
  @override
  _AgariCheckPage createState() => _AgariCheckPage();
  const AgariCheckPage(this.tehai, {super.key});
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