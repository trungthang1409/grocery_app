import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../sevices/untils.dart';
import 'heart_btn.dart';
import 'price_widget.dart';

class OnsaleWidget extends StatefulWidget {
  const OnsaleWidget({super.key});

  @override
  State<OnsaleWidget> createState() => _OnsaleWidgetState();
}

class _OnsaleWidgetState extends State<OnsaleWidget> {
  @override
  Widget build(BuildContext context) {
    final untils = Untils(context);
    Size size = untils.getsizeScreen;
    Color color = untils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl: 'https://vinmec-prod.s3.amazonaws.com/images/20210310_142624_715905_trai_cay_1.max-1800x1800.jpg',
                      width: size.width * 0.22,
                      height: size.width * 0.21,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: '1Kg',
                          color: color,
                          textSize: 22,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            const HeartBtn(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const PriceWidget(
                  isOnsale: true,
                  price: 5.9,
                  salePrice: 2.99,
                  textPrice: '1',
                ),
                const SizedBox(
                  height: 4,
                ),
                TextWidget(
                  text: 'Cam',
                  color: color,
                  textSize: 15,
                  isTitle: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
