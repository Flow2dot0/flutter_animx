import 'package:flutter/material.dart';

class BAnimatedContainer {
  Duration duration;
  double min;
  double max;
  double heightValue;
  double widthValue;
  Color color;
  bool shadow;
  bool radius;

  BAnimatedContainer(
      {this.duration,
      this.min,
      this.max,
      this.heightValue,
      this.widthValue,
      this.color,
      this.shadow,
      this.radius});
}
