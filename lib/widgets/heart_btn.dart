import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../sevices/untils.dart';

class HeartBtn extends StatelessWidget {
  const HeartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final untils = Untils(context);
    Color color = untils.color;
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
