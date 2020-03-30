import 'package:flutter/material.dart';
import 'package:flutter_animx/models/datas.dart';
import 'package:flutter_animx/models/section.dart';

class Tile extends StatelessWidget {
  final Section section;

  const Tile({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(section.icon),
      title: Text(section.name),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => Datas().pusher(context, section.name, section.destination),
    );
    ;
  }
}
