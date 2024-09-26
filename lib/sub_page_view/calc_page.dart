import 'package:augsix/model/app_data.dart';
import 'package:augsix/model/player_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color? BACKGROUND_COLOR = Colors.green[100];

class CalcPage extends StatefulWidget {
  @override
  _CalcPage createState() => _CalcPage();
}

class _CalcPage extends State<CalcPage> {
  late List<Widget> list = [];
  late TextEditingController _tmpScore = TextEditingController();

  @override
  void initState() {
    super.initState();
    for(int i = 1; i <= 4; i++) {
      appData.players.add(PlayerScore("Player${i}", 25000));
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
          Container(
            // height: size.height * (1/3),
            child: SingleChildScrollView(
              child: Column(
                children: list,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.lightGreen[700],
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _tmpScore,
                        canRequestFocus: false,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontFamily: "OptFont", fontSize: 24, color: Colors.white),
                      ),
                    )
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () => setState(() => pushButton("7")),
                                child: Text("7", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("8")),
                                child: Text("8", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("9")),
                                child: Text("9", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => clearText()),
                                child: Text("C", style: TextStyle(color: Colors.brown[800], fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.orangeAccent, ),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () => setState(() => pushButton("4")),
                                child: Text("4", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("5")),
                                child: Text("5", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("6")),
                                child: Text("6", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              IconButton(
                                onPressed: () => setState(() => backspace()),
                                icon: Icon(Icons.backspace),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                style: TextButton.styleFrom(backgroundColor: Colors.orangeAccent, ),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
                          ),
                          Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () => setState(() => pushButton("1")),
                                child: Text("1", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("2")),
                                child: Text("2", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("3")),
                                child: Text("3", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => changeTsumo()),
                                child: Text("ﾂﾓ", style: TextStyle(fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.limeAccent, ),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
                          ),
                          Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () => setState(() => pushButton("0")),
                                child: Text("0", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => pushButton("00")),
                                child: Text("00", style: TextStyle(color: Colors.white, fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => changeParent()),
                                child: Text("親", style: TextStyle(color: Colors.brown[800], fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.limeAccent, ),
                              ),
                              TextButton(
                                onPressed: () => setState(() => changeChild()),
                                child: Text("子", style: TextStyle(color: Colors.brown[800], fontFamily: "OptFont", fontSize: 20),),
                                style: TextButton.styleFrom(backgroundColor: Colors.limeAccent, ),
                              ),
                            ].map((element) => Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: element,))).toList(),
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
    appData.players.forEach((element) => element.setInput = _tmpScore.text);
  }

  void clearText() {
    _tmpScore.text = "";
    appData.players.forEach((element) => element.setInput = "0");
  }
  
  void backspace() {
    if(_tmpScore.text.length > 0) {
      _tmpScore.text = _tmpScore.text.substring(0, _tmpScore.text.length-1);
      if(_tmpScore.text.isNotEmpty) {
        appData.players.forEach((element) => element.setInput = _tmpScore.text);
      } else {
        appData.players.forEach((element) => element.setInput = "0");
      }
    }
  }

  void changeTsumo() {
    _tmpScore.text = "4321/1234";
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('実装中だよ。', style: TextStyle(fontFamily: "OptFonts"),)));
  }

  void changeChild() {
    _tmpScore.text = "4321";
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('実装中だよ。', style: TextStyle(fontFamily: "OptFonts"),)));
  }

  void changeParent() {
    _tmpScore.text = "4321";
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('実装中だよ。', style: TextStyle(fontFamily: "OptFonts"),)));
  }
}