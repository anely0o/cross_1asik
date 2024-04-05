import 'package:flutter/material.dart';
import 'package:flutter_villains/villains/villains.dart';

class FadeInWave extends StatelessWidget {
  final Widget child;
  final int from;
  final int to;

  const FadeInWave(
      {super.key, required this.child, this.from = 150, this.to = 400});

  @override
  Widget build(BuildContext context) {
    return Villain(
        villainAnimation: VillainAnimation(
            animatable: Tween<double>(begin: 0.7, end: 1),
            animatedWidgetBuilder: (animation, child) {
              return FadeTransition(
                  opacity: animation as Animation<double>, child: child);
            },
            from: Duration(milliseconds: from),
            to: Duration(milliseconds: to)),
        animateExit: true,
        animateEntrance: true,
        secondaryVillainAnimation: VillainAnimation.fade(),
        child: child);
  }
}
