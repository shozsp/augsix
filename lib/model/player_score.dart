import 'package:flutter/material.dart';

class PlayerScore {
  late String _name;
  late int _score;
  late int _input = 0;
  late List<int> _scoreHistory = [];
  late final TextEditingController _controller = TextEditingController();

  PlayerScore(String name, int score) {
    _name = name;
    _score = score;
    _controller.text = score.toString();
    addScoreHistory(_score.toString());
  }
  set setName(String str) => _name = str;
  get getName { return _name; }
  set setScore(String num) => _score = int.parse(num);
  get getScore { return _score; }
  set setInput(String num) => _input = int.parse(num);
  get getInput { return _input; }
  void addScoreHistory(String num) {
    if(_scoreHistory.length < 10) {
      _scoreHistory.add(int.parse(num));
    } else {
      _scoreHistory = _scoreHistory.sublist(1);
    }
  }
  int popScoreHistory() { return _scoreHistory.removeLast(); }

  Card toCard() {
    return Card(
      child: ListTile(
        title: Text(_name),
        // leading: IconButton(onPressed: () => changePlayerName(), icon: Icon(Icons.edit_note)),
        subtitle: TextFormField(controller: _controller, enabled: false,),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,child: IconButton(onPressed: () => addScore(), icon: const Icon(Icons.add), iconSize: 20, style: TextButton.styleFrom(backgroundColor: Colors.red[200],), padding: EdgeInsets.zero,),),
            Container(height: 20,margin: const EdgeInsets.only(top: 8),child: IconButton(onPressed: () => minusScore(), icon: const Icon(Icons.remove), iconSize: 20, style: TextButton.styleFrom(backgroundColor: Colors.blue[100],), padding: EdgeInsets.zero,),),
          ],
        ),
      )
    );
  }

  void addScore() {
    _score += _input;
    _controller.text = _score.toString();
    addScoreHistory(_score.toString());
  }

  void minusScore() {
    _score -= _input;
    _controller.text = _score.toString();
    addScoreHistory(_score.toString());
  }

  void changePlayerName() {
  }
}