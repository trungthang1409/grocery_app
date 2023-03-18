import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/cart/card_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../sevices/untils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final untils = Untils(context);
    Color color = untils.color;
    Size size = untils.getsizeScreen;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(IconlyBroken.delete),
            onPressed: () {},
            color: color,
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Cart (2)',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: Column(
        children: [
          _checkcout(context: context),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkcout({required BuildContext context}) {
    final untils = Untils(context);
    Color color = untils.color;
    Size size = untils.getsizeScreen;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(text: 'Order Now', color: color, textSize: 18),
                ),
              ),
            ),
            FittedBox(
              child: TextWidget(
                color: color,
                text: 'Total: \$5.9',
                textSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
