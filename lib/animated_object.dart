import 'package:flutter/material.dart';
import 'package:flutter_villains/villains/villains.dart';

class AnimatedObject extends StatelessWidget {
  final Widget child;
  final int from;
  final int to;

  const AnimatedObject(
      {super.key, required this.child, this.from = 150, this.to = 400});

  @override
  Widget build(BuildContext context) {
    return Villain(
        villainAnimation: VillainAnimation.fromBottom(
            from: Duration(milliseconds: from), to: Duration(milliseconds: to)),
        animateExit: true,
        animateEntrance: true,
        secondaryVillainAnimation: VillainAnimation.fade(),
        child: child);
  }
}
