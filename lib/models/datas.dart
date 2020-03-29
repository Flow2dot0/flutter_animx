import 'package:flutter/material.dart';
import 'package:flutter_animx/models/material_design.dart';

class Datas {
  String flutter = 'app_assets/images/flutter_logo.png';

  pusher(BuildContext context, String title, Widget destination) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MyScaffold(
        title: title,
        destination: destination,
      );
    }));
  }
}
