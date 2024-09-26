import 'package:augsix/model/player_score.dart';

class AppData {
  static final AppData _appData = new AppData._internal();
  List<PlayerScore> players = [];
  List<dynamic> tehai = [];
  bool agariCheckButtonIsDisabled = false;
  factory AppData() {
    return _appData;
  }
  AppData._internal();
}
final appData = AppData();