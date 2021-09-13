import 'package:catalog/constants/fonts.dart';
import 'package:catalog/services/data_manager/items.dart';
import 'package:flutter/material.dart';

abstract class ItemsListWidget extends StatelessWidget {
  final color = Color.fromRGBO(0, 0, 0, 0.2);

  final altColor = Color.fromRGBO(250, 250, 250, 0.2);

  final padding = EdgeInsets.all(16.0);

  final vSpace = 16.0;

  final itemStyle = TextStyle(fontSize: 20, fontFamily: Fonts.josefinSlab, color: Colors.white);

  final Items items;

  ItemsListWidget({required this.items});

  int itemNumber(int index) {
    return index ~/ 2;
  }

  Color backgroundColorForIndex(int index) {
    return itemNumber(index).isOdd ? color : altColor;
  }

  bool shouldBuildSpace(int index) {
    return index.isOdd;
  }

  Widget buildItemWidget(int index);

  Widget buildVSpacing() {
    return SizedBox(height: vSpace);
  }

  Widget buildItem(BuildContext context, int index) {
    return shouldBuildSpace(index) ? buildVSpacing() : buildItemWidget(index);
  }

  SliverChildBuilderDelegate listBuilder() {
    return SliverChildBuilderDelegate(
      (context, index) => buildItem(context, index),
      childCount: items.count * 2, // *2 half of the children will be spacing
    );
  }

  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverPadding(
          padding: padding,
          sliver: SliverList(
            delegate: listBuilder(),
          ),
        ),
      ],
    );
  }
}
