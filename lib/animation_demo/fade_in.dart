import 'package:flutter/material.dart';
import 'package:flutter_animx/models/datas.dart';

class FadeInDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage(
        placeholder: AssetImage(Datas().flutter),
        image: NetworkImage(
            'https://cdn-media.rtl.fr/cache/rBcbyenhL4VFtTM2fLtzJg/880v587-0/online/image/2019/0605/7797776478_un-extrait-du-film-dragon-ball-super-broly.jpg'),
        fadeInCurve: Curves.linear,
//        fadeOutCurve: Curves.linear,
        fadeInDuration: Duration(seconds: 1),
        fadeOutDuration: Duration(milliseconds: 750),
      ),
    );
  }
}
