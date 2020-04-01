import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  @override
  _AnimatedListDemoState createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  List<String> items = ['banane', 'poire', 'pêche', 'abricot'];

  Widget slideTile(String name, int index, Animation animation) {
    return SlideTransition(
      position: animation.drive(Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset(0, 0),
      )),
      child: ListTile(
        title: Text(name),
        leading: Text(index.toString()),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            removeItem(index);
          },
        ),
      ),
    );
  }

  addItem(String name) {
    int index = (items.length == 0) ? 0 : Random().nextInt(items.length);
    items.insert(index, name);
    _key.currentState.insertItem(index);
  }

  removeItem(int index) {
    String name = items[index];
    items.removeAt(index);
    _key.currentState.removeItem(index, (context, animation) {
      return slideTile(name, index, animation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: 'Add a fruit'),
          onSubmitted: (fruit) {
            addItem(fruit);
          },
        ),
        Expanded(
          child: AnimatedList(
            key: _key,
            initialItemCount: items.length,
            itemBuilder: (ctx, i, animation) {
              return slideTile(items[i], i, animation);
            },
          ),
        )
      ],
    );
  }
}
