import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../sevices/untils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.salePrice, required this.price, required this.textPrice, required this.isOnsale});
  final double salePrice, price;
  final String textPrice;
  final bool isOnsale;
  @override
  Widget build(BuildContext context) {
    final Color color = Untils(context).color;
    double userPrice = isOnsale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            color: Colors.green,
            textSize: 18,
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnsale ? true : false,
            child: Text(
              "\$${(price * int.parse(textPrice)).toStringAsFixed(2)}",
              style: TextStyle(color: color, fontSize: 15, decoration: TextDecoration.lineThrough),
            ),
          )
        ],
      ),
    );
  }
}
