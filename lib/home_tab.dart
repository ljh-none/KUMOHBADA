import 'package:flutter/material.dart';
import 'package:kumohbada/main.dart';

class HomeTabContent extends StatefulWidget {
  const HomeTabContent({super.key});

  @override
  State<HomeTabContent> createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent> {
  //더미데이터
  @override
  Widget build(BuildContext context) {
    //위젯 빌드 함수
    Widget? buildListView(context, index) {
      return ListTile(
        title: Text(items[index].title),
        subtitle: Text(items[index].price.toString()),
        );
    }

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: buildListView,
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.black);
      },
    );
  }
}
