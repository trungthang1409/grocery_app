import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/onsale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../sevices/untils.dart';

class OnsaleScreen extends StatelessWidget {
  static const routeName = '/OnsaleScreen';
  const OnsaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    final untils = Untils(context);
    Size size = untils.getsizeScreen;
    Color color = untils.color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextWidget(
          text: 'Products on sale',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
      ),
      body: isEmpty
          ? Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset('images/box.png'),
                  ),
                  Text(
                    'No products on sale yet!,\nStay tuned',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.66),
              children: List.generate(
                16,
                (index) {
                  return const OnsaleWidget();
                },
              ),
            ),
    );
  }
}
