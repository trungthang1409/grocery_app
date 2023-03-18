import 'package:flutter/material.dart';
import 'package:grocery_app/sevices/untils.dart';
import 'package:grocery_app/widgets/categories_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
    super.key,
  });
  List<Color> gridColors = [
    const Color(0xff53b175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'images/cat/fruits.jpg',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'images/cat/vgtbls.jpg',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'images/cat/herbss.jpg',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'images/cat/nutsss.jpg',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'images/cat/spices.jpg',
      'catText': 'Spices',
    },
    {
      'imgPath': 'images/cat/grains.jpg',
      'catText': 'Grains',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final untils = Untils(context);
    Color color = untils.color;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: 'Categories', color: color, textSize: 24),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 280 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              imgPath: catInfo[index]['imgPath'],
              catText: catInfo[index]['catText'],
              passedcolor: gridColors[index],
            );
          }),
        ),
      ),
    );
  }
}
