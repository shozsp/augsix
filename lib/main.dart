import 'package:augsix/utils/utils.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'augsix',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: const SidebarPage(),
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
          text: '持ち点管理',
          icon: Icons.calculate,
          onPressed: () => setState(() => _headline = '持ち点管理'),
          isSelected: true,
      ),
      CollapsibleItem(
        text: '役リスト',
        icon: Icons.list,
        onPressed: () => setState(() => _headline = '役リスト'),
      ),
      CollapsibleItem(
        text: '手牌スキャン',
        icon: Icons.photo_camera,
        onPressed: () => setState(() => _headline = '手牌スキャン'),
      ),
      CollapsibleItem(
        text: '手牌編集',
        icon: Icons.edit_square,
        onPressed: () => setState(() => _headline = '手牌編集'),
      ),
      // CollapsibleItem(
      //   text: '上がりチェック',
      //   icon: Icons.fact_check,
      //   onPressed: () => setState(() => _headline = '上がりチェック'),
      // ),
      // CollapsibleItem(
      //   text: '点数計算',
      //   icon: Icons.functions,
      //   onPressed: () => setState(() => _headline = '点数計算'),
      // ),
      // CollapsibleItem(
      //   text: 'ライセンス',
      //   icon: Icons.card_membership,
      //   onPressed: () => setState(() => _headline = 'ライセンス'),
      // )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        toggleTitle: "閉じる",
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        collapseOnBodyTap: false,
        avatarBackgroundColor: Colors.white60,
        title: 'まーじゃんつーる',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('使ってくれてありがとう！', style: TextStyle(fontFamily: "OptFonts"),)));
        },
        body: _body(size, context),
        backgroundColor: Colors.brown,
        selectedIconBox: Colors.deepOrangeAccent,
        selectedTextColor: Colors.limeAccent,
        selectedIconColor: Colors.lightGreenAccent,
        customItemOffsetX: 10,
        textStyle: const TextStyle(fontSize: 18, fontFamily: "OptFonts"),
        titleStyle: const TextStyle(
            fontSize: 20,
            fontFamily: "OptFonts",
            fontWeight: FontWeight.bold),
        toggleTitleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "OptFonts"),
        sidebarBoxShadow: const [
          BoxShadow(
            color: Colors.brown,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.grey,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Transform.rotate(
          angle: 0,
          child: Transform.translate(
            offset: const Offset(0, 0),
            child: SelectPage(context, _headline)
          ),
        ),
      ),
    );
  }
}