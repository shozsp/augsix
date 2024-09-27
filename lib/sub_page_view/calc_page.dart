import 'package:augsix/model/app_data.dart';
import 'package:augsix/model/player_score.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final Color? BACKGROUND_COLOR = Colors.green[100];

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  _CalcPage createState() => _CalcPage();
}

class _CalcPage extends State<CalcPage> {
  late List<Widget> list = [];
  late final TextEditingController _tmpScore = TextEditingController();

  @override
  void initState() {
    super.initState();
    for(int i = 1; i <= 4; i++) {
      appData.players.add(PlayerScore("Player$i", 25000));
      list.add(appData.players[i-1].toCard());
    }
    _tmpScore.text = "";
  }
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: list,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    color: Colors.lightGreen[700],
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _tmpScore,
                        canRequestFocus: false,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(fontFamily: "OptFont", fontSize: 24, color: Colors.white),
                      ),
                    )
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () => setState(() => pushButton("7")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("7", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("8")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("8", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("9")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("9", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => clearText()),
                                style: TextButton.styleFrom(backgroundColor: Colors.orangeAccent, ),
                                child: Text("C", style: TextStyle(color: Colors.brown[800], fontFamily: "OptFont", fontSize: 20),),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () => setState(() => pushButton("4")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("4", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("5")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("5", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("6")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("6", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              IconButton(
                                onPressed: () => setState(() => backspace()),
                                icon: const Icon(Icons.backspace),
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                style: TextButton.styleFrom(backgroundColor: Colors.orangeAccent, ),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
                          ),
                          Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () => setState(() => pushButton("1")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("1", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("2")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("2", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("3")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("3", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => changeTsumo()),
                                style: TextButton.styleFrom(backgroundColor: Colors.limeAccent, ),
                                child: const Text("ﾂﾓ", style: TextStyle(fontSize: 20),),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
                          ),
                          Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () => setState(() => pushButton("0")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("0", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("00")),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                                child: const Text("00", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => changeParent()),
                                style: TextButton.styleFrom(backgroundColor: Colors.limeAccent, ),
                                child: Text("親", style: TextStyle(color: Colors.brown[800], fontFamily: "OptFont", fontSize: 20),),
                              ),
                              TextButton(
                                onPressed: () => setState(() => changeChild()),
                                style: TextButton.styleFrom(backgroundColor: Colors.limeAccent, ),
                                child: Text("子", style: TextStyle(color: Colors.brown[800], fontFamily: "OptFont", fontSize: 20),),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
                          )
                        ].map((element) => Expanded(child: element)).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pushButton(String input) {
    _tmpScore.text = _tmpScore.text + input;
    for (var element in appData.players) {
      element.setInput = _tmpScore.text;
    }
  }

  void clearText() {
    _tmpScore.text = "";
    for (var element in appData.players) {
      element.setInput = "0";
    }
  }
  
  void backspace() {
    if(_tmpScore.text.isNotEmpty) {
      _tmpScore.text = _tmpScore.text.substring(0, _tmpScore.text.length-1);
      if(_tmpScore.text.isNotEmpty) {
        for (var element in appData.players) {
          element.setInput = _tmpScore.text;
        }
      } else {
        for (var element in appData.players) {
          element.setInput = "0";
        }
      }
    }
  }

  void changeTsumo() {
    _tmpScore.text = "4321/1234";
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('実装中だよ。', style: TextStyle(fontFamily: "OptFonts"),)));
  }

  void changeChild() {
    _tmpScore.text = "4321";
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('実装中だよ。', style: TextStyle(fontFamily: "OptFonts"),)));
  }

  void changeParent() {
    _tmpScore.text = "4321";
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('実装中だよ。', style: TextStyle(fontFamily: "OptFonts"),)));
  }
}