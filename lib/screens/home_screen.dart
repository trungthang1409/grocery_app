import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner_screens/onsale_screen.dart';
import 'package:grocery_app/sevices/untils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../inner_screens/feeds_screen.dart';
import '../widgets/feed_items.dart';
import '../widgets/onsale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  final List<String> Images = [
    'images/swip/img2.jpg',
    'images/swip/img3.jpg',
    'images/swip/img4.jpg',
    'images/swip/img1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final untils = Untils(context);
    Size size = untils.getsizeScreen;
    Color color = untils.color;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: Images.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  ),
                ),
                control: const SwiperControl(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, OnsaleScreen.routeName);
                },
                child: TextWidget(
                  text: 'View All',
                  color: Colors.blue,
                  textSize: 22,
                )),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On Sale'.toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const OnsaleWidget();
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our Products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, FeedsScreen.routeName);
                      },
                      child: TextWidget(
                        text: 'Browse all',
                        color: Colors.blue,
                        textSize: 22,
                      )),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: size.width / (size.height * 0.66),
              children: List.generate(
                4,
                (index) {
                  return const FeedsWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
