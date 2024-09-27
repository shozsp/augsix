import 'package:flutter/material.dart';
import 'package:augsix/utils/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class YakuListPage extends StatelessWidget {
  const YakuListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return creating(context);
  }

  FutureBuilder<dynamic> creating(BuildContext context) {
    dynamic json = LoadJson("resource/Yaku.json");
    return FutureBuilder<dynamic>(
      future: json,
      builder: (context, yakuJson) {
        if (yakuJson.hasData) {
          List<Widget> list = [];
          for (String yaku in yakuJson.data["役"].keys){
            String explain = HansuTextCheck(yakuJson.data["役"][yaku]["翻数"]);
            String naki = MakeNakiText(
                yakuJson.data["役"][yaku]["鳴きあり"],
                yakuJson.data["役"][yaku]["翻数"] - yakuJson.data["役"][yaku]["減点"]
            );
            list.add(Card(
              color: Colors.grey[180],
              child: ListTile(
                title: Text(yaku, style: const TextStyle(fontFamily: "OptFonts")),
                subtitle: Text(explain, style: const TextStyle(fontFamily: "OptFonts")),
                trailing: Text(naki),
              ),
            ));
          }
          return ListView(
            children: list,
          );
        } else {
          return LoadingAnimationWidget.discreteCircle(
              color: Colors.lightGreen, size: 80);
        }
      },
    );
  }
}