import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../sevices/untils.dart';
import '../widgets/feed_items.dart';
import '../widgets/text_widget.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = '/FeedsScreen';
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TextEditingController? _textsearchController = TextEditingController();
  FocusNode _textfocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    _textsearchController!.dispose();
    _textfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        elevation: 0,
        title: TextWidget(
          text: 'All products',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  controller: _textsearchController,
                  focusNode: _textfocusNode,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    hintText: "What's in your mind",
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        _textsearchController!.clear();
                        _textfocusNode.unfocus();
                      },
                      icon: const Icon(Icons.close),
                      color: _textfocusNode.hasFocus ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: size.width / (size.height * 0.66),
              children: List.generate(
                16,
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
